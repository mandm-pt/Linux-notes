
# References
* https://github.com/nextcloud/nextcloud-snap
* https://github.com/nextcloud/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition
* https://docs.nextcloud.com/server/20/admin_manual/installation/installation_wizard.html
* https://docs.nextcloud.com/server/20/admin_manual/configuration_server/occ_command.html

# Installation

Install nextcloud snap package: `sudo snap install nextcloud`

## Set data directory

Give the snap permission to access removable media by connecting that interface:
`sudo snap connect nextcloud:removable-media`

Create data directory: `mkdir /mnt/datadrive/nextcloud/data`

Give necessary permissions:
```bash
 sudo mkdir -p /mnt/datadrive/nextcloud/data
 sudo chown -R root:root /mnt/datadrive/nextcloud/data
 sudo chmod 0770 /mnt/datadrive/nextcloud/data
```

Edit the following file and `/var/snap/nextcloud/current/nextcloud/config/autoconfig.php`:
```php
 // ...
 'directory' => '/mnt/datadrive/nextcloud/data',
 // ...
```

Restart the PHP service: `sudo snap restart nextcloud.php-fpm`

## Create admin account

Setup admin account `sudo nextcloud.manual-install USER PASSWORD`

## Configure Trusted domain

> Use a dedicated domain for Nextcloud: `cloud.domain.tld` [More info](https://docs.nextcloud.com/server/20/admin_manual/installation/harden_server.html#use-a-dedicated-domain-for-nextcloud)


You can view the current settings by querying the value of the trusted_domains array:

`sudo nextcloud.occ config:system:get trusted_domains`

To set your domain name run the following command (replace CLOUD.DOMAIN.TLD)
```bash
sudo nextcloud.occ config:system:set trusted_domains 1 --value=CLOUD.DOMAIN.TLD
```

Alternativly you can modify `/var/snap/nextcloud/current/nextcloud/config/config.php`

```php
'trusted_domains' =>
  array (
   0 => 'localhost',
   1 => 'server1.example.com',
   2 => '192.168.1.50',
   3 => '[fe80::1:50]',
),
```

## Enabling SSL

Run the following command and follow the wizard
`sudo nextcloud.enable-https lets-encrypt`

## Setup fail2ban

Create a file in `/etc/fail2ban/filter.d` named `nextcloud.conf` with the following contents:

```
[Definition]
_groupsre = (?:(?:,?\s*"\w+":(?:"[^"]+"|\w+))*)
failregex = ^\{%(_groupsre)s,?\s*"remoteAddr":"<HOST>"%(_groupsre)s,?\s*"message":"Login failed:
            ^\{%(_groupsre)s,?\s*"remoteAddr":"<HOST>"%(_groupsre)s,?\s*"message":"Trusted domain error.
datepattern = ,?\s*"time"\s*:\s*"%%Y-%%m-%%d[T ]%%H:%%M:%%S(%%z)?"
```

The jail file defines how to handle the failed authentication attempts found by the Nextcloud filter.

Create a file in `/etc/fail2ban/jail.d` named `nextcloud.local` with the following contents:

```
[nextcloud]
backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = nextcloud
maxretry = 3
bantime = 86400
findtime = 43200
logpath = /var/snap/nextcloud/current/logs/nextcloud.log
```

Restart the fail2ban service.

`sudo systemctl restart fail2ban.service`

Check the status of your Nextcloud jail by running:

`sudo fail2ban-client status nextcloud`

# Management

* Show list of commands: `sudo nextcloud.occ list`

* Show command help, example: `sudo nextcloud.occ files:scan -h`

* List all the applications currently available to Nextcloud organized by Enabled or Disabled:
`nextcloud.occ app:list`

* Disable one of the currently enabled apps (or vice versa):
`nextcloud.occ app:disable calendar`

* You can use app:update to manually update all or specified apps:
`nextcloud.occ app:update --all`

* The status command will print some basic version information:
`nextcloud.occ status`

# Useful Apps

* [Metadata](https://apps.nextcloud.com/apps/metadata)
* [News](https://apps.nextcloud.com/apps/news)
* [Maps](https://apps.nextcloud.com/apps/maps)
* [Notes](https://apps.nextcloud.com/apps/notes)

# Important Notes

## Browser uploading big files > 512MB

The default maximum file size for uploads is 512MB. You can increase this limit up to what your filesystem and operating system allows. There are certain hard limits that cannot be exceeded:

* 2GB on 32Bit OS-architecture
* 2GB with IE6 - IE8
* 4GB with IE9 - IE11

64-bit filesystems have much higher limits; consult the documentation for your filesystem.

> The Nextcloud sync client is not affected by these upload limits as it is uploading files in smaller chunks. See Client documentation for more information on configuration options.

## Backup

[More info](https://docs.nextcloud.com/server/20/admin_manual/maintenance/backup.html)

## Scan files

We can add files manually directly to a user folder, example: `/mnt/datadrive/nextcloud/data/USER`

We can use rsync to transfer the data:
`rsync -Pe ssh --rsync-path='sudo rsync' ./*.doc HOST:/mnt/datadrive/nextcloud/data/USER/files`

If we add files directly, we have to tell nextcloud to rescan the data directoy.
Make sure the files you copy to the data directory have the appropriate permissions.
`chown root:root FILE` or `chown -R root:root PATH/FOLDER` and `chmod 0640 FILE`

Rescan entire user's data : `sudo nextcloud.occ files:scan USER`
Rescan a specific directory with verbose: `sudo nextcloud.occ files:scan -p /USER/files/Photos -v USER`

[More info](https://docs.nextcloud.com/server/20/admin_manual/configuration_server/occ_command.html#file-operations)

## Dav Commands

[More info](https://docs.nextcloud.com/server/20/admin_manual/configuration_server/occ_command.html#dav-commands)

Adds all birthdays to your calendar from addressbooks shared with you. 
`sudo nextcloud.occ dav:sync-birthday-calendar USER`