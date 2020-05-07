# Basic Raspberry Setup

More info [here](https://www.raspberrypi.org/documentation/)

## Prepare SD Card

1. Copying `.img` file to sd card\
   `dd bs=4M if=FILE.img of=/dev/mmcblk0 conv=fsync`
2. Create `ssh` file in boot partition to enable SSH\
   `touch ssh`
3. Create `wpa_supplicant.conf` file in boot partition to setup wifi\
   File example:
   ```
   ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
   update_config=1
   country=<Insert country code here>

   network={
   ssid="<Name of your WiFi>"
   psk="<Password for your WiFi>"
   }
   ```

## Account

1. Change default password of `pi` (`raspberry`)
2. Create New Username\
   `sudo adduser USERNAME`
3. Add new user to `sudo` group\
   `sudo usermod -a -G sudo USERNAME`
4. Login with new user
5. Delete `pi` user and remove home directory\
   `sudo userdel -r pi`

## SSH

Edit file `/etc/ssh/sshd_config`

1. Disable Root\
   `PermitRootLogin no`
2. Whitelist Users
   1. At the end of the file, add: `AllowUsers USERNAME`
3. Generate keys\
   `ssh-keygen -t ed25519 -C "Raspberry keys"`
4. Copy key to remote machine\
   `ssh-copy-id -i /path/to/public-key-file USERNAME@IP`
4. Public key authentication\
   ```
   ChallengeResponseAuthentication no
   PasswordAuthentication no
   UsePAM no
   ```
5. Restart sshd daemon\
   `sudo systemctl restart ssh`

## Update packages

1. `sudo apt update && sudo apt upgrade -y`
