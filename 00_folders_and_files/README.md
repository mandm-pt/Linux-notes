# Main Folders

* `/`: The Root Directory
* `/bin`: All the executable binary programs (file) required during booting, repairing, files required to run into single-user-mode, and other important, basic commands viz., cat, du, df, tar, rpm, wc, history, etc.
* `/boot`: Holds important files during boot-up process, including Linux Kernel.
* `/dev`: Contains device files for all the hardware devices on the machine e.g., cdrom, cpu, etc
* `/etc`: Contains Application’s configuration files, startup, shutdown, start, stop script for every individual program.
* `/home`: Home directory of the users. Every time a new user is created, a directory in the name of user is created within home directory which contains other directories like Desktop, Downloads, Documents, etc.
* `/lib`: The Lib directory contains kernel modules and shared library images required to boot the system and run commands in root file system.
* `/lost+found`: This Directory is installed during installation of Linux, useful for recovering files which may be broken due to unexpected shut-down.
* `/media`: Temporary mount directory is created for removable devices viz., media/cdrom.
* `/mnt`: Temporary mount directory for mounting file system.
* `/opt`: Optional is abbreviated as opt. Contains third party application software. Viz., Java, etc.
* `/proc`: A virtual and pseudo file-system which contains information about running process with a particular Process-id aka pid.
* `/root`: This is the home directory of root user and should never be confused with ‘/‘
* `/run`: This directory is the only clean solution for early-runtime-dir problem.
* `/sbin`: Contains binary executable programs, required by System Administrator, for Maintenance. Viz., iptables, fdisk, ifconfig, swapon, reboot, etc.
* `/srv`: Service is abbreviated as ‘srv‘. This directory contains server specific and service related files.
* `/sys`: Modern Linux distributions include a /sys directory as a virtual filesystem, which stores and allows modification of the devices connected to the system.
* `/tmp`: System’s Temporary Directory, Accessible by users and root. Stores temporary files for user and system, till next boot.
* `/usr`: Contains executable binaries, documentation, source code, libraries for second level program.
* `/var`: Stands for variable. The contents of this file is expected to grow. This directory contains log, lock, spool, mail and temp files.

## Oher useful folders

* `/etc/bashrc`: Contains system defaults and aliases used by bash shell.
* `/etc/profile.d`: Application script, executed after login.
* `/etc/skel`: Contains files and directories that are automatically copied over to a new user's home directory when such user is created by the useradd program

## Useful files

* `/etc/crontab`: A shell script to run specified commands on a predefined time Interval.
* `/etc/hostname`: Stores the name of the host computer(Used in Debian).For Red Hat Linux it would be `/etc/sysconfig/network`.
* `/etc/hosts`: Information of Ip addresses and corresponding host names.
* `/etc/hosts.allow`: List of hosts allowed to access services on the local machine.
* `/etc/host.deny`: List of hosts denied to access services on the local machine.
* `/etc/motd`: Message Of The Day, The Message users gets upon login.
* `/etc/passwd`: Contains password of system users in a shadow file, a security implementation.
* `/etc/group`: similar to /etc/passwd but for groups
* `/etc/profile`: Bash shell defaults
* `/etc/resolv.conf`: Domain Name Servers (DNS) being used by System.

## Logging

* `/var/log/auth.log` and `/var/log/secure`: Store all security-related events such as logins, root user actions, and output from pluggable authentication modules (PAM). **Ubuntu** and **Debian** use `/var/log/auth.log`, while **Red Hat** and **CentOS** use `/var/log/secure`.
* `/var/log/btmp`: keeps a note of all failed login attempts. (use `utmpdump` command to see contents)
* `/var/log/cron`: Stores information about scheduled tasks (cron jobs). Use this data to verify that your cron jobs are running successfully.
* `/var/log/dpkg.log`: 
* `/var/log/kern.log`: Stores kernel events, errors, and warning logs, which are particularly helpful for troubleshooting custom kernels.
* `/var/log/syslog` and `/var/log/messages`: Store all global system activity data, including startup messages. Debian-based systems like **Ubuntu** store this in `/var/log/syslog`, while Red Hat-based systems like **RHEL** or **CentOS** use `/var/log/messages`.
* `/var/log/wtmp`: List login time and duration of each user on the system currently. (use `utmpdump` command to see contents)


More info [here](https://www.tecmint.com/linux-directory-structure-and-important-files-paths-explained/)
