Complete installation guide [here](https://wiki.archlinux.org/index.php/Installation_guide)

# installation

> To switch to a different console use the `Alt+arrow` shortcut. To view installation guide use [elinks](https://wiki.archlinux.org/index.php/ELinks).

## Set keyboard layout

```bash
loadkeys pt-latin9
```

## Connect to the internet
Check network interfaces
```bash
ip link
```

### Configuring wifi
Using [netctl](https://wiki.archlinux.org/index.php/Network_configuration#Network_managers) for automatically configure wireless since it comes as [base package](https://git.archlinux.org/archiso.git/tree/configs/releng/packages.x86_64)
```bash
wifi-menu
```
If needed execute the following command to unblock wireless card that might be blocked by the kernel. Make sure isn't blocked by hardware as well.
```bash
rfkill unblock all
```


## Update the system clock
```bash
timedatectl set-ntp true
```

## Partition the disks
Lists block devices using [lsblk](https://wiki.archlinux.org/index.php/Device_file#lsblk)
```bash
lsblk
```

Create partition table with `fdisk` or `cfdisk` (basic partitioning functionality with a curses-based user interface)

```bash
cfdisk
```

### BIOS/MBR example layout
More layouts [here](https://wiki.archlinux.org/index.php/Partitioning#Example_layouts)

| Mount point | Partition | Partition type ID | Boot flag |     Suggested size      |
| :---------: | :-------: | :---------------: | :-------: | :---------------------: |
|      /      | /dev/sda1 |     83: Linux     |    Yes    |        23–32 GiB        |
|   [swap]    | /dev/sda2 |  82: Linux swap   |    No     |    More than 512 MiB    |
|    /home    | /dev/sda3 |     83: Linux     |    No     | Remainder of the device |

## Format the partitions
Formating using `ext4` file system
```bash
mkfs.ext4 /dev/sdX1
```

Initialize swap 
```bash
mkswap /dev/sdX2
swapon /dev/sdX2
```

## Mount the file systems
Mount the file system on the root partition to `/mnt` 
```bash
mount /dev/sdX1 /mnt
```

## Select the mirrors

The higher a mirror is placed in the list, the more priority it is given when downloading a package.
```bash
nano /etc/pacman.d/mirrorlist
```

## Install essential packages

> Additional packages

| Description                 | Package(s)                          |
| :-------------------------- | :---------------------------------- |
| Boot loader                 | grub                                |
| Microcode                   | intel-ucode                         |
| Filesystem utilities        | e2fsprogs                           |
| User delegatation util      | sudo                                |
| text editor                 | nano                                |
| Network manager             | networkmanager                      |
| documentation               | man-db, man-pages, texinfo          |
| Display server + xorg-apps  | xorg                                |
| Xfce desktop environment    | xfce4, xfce4-goodies                |
| display manager             | lightdm lightdm-gtk-greeter         |
| Audio                       | pulseaudio, xfce4-pulseaudio-plugin |
| Disk Management Service     | udisks2                             |
| Open-source Graphics Driver | mesa xf86-video-nouveau             |

Base installation
```bash
pacstrap /mnt base linux linux-firmware
```

# Configure the system

## Fstab
Generate a fstab file 
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## Chroot
```bash
arch-chroot /mnt
```

## Set the time zone
The time zone can also be selected interactively with `tzselect`
```bash
ln -sf /usr/share/zoneinfo/Europe/Dublin /etc/localtime
```

Generation of `/etc/adjtime`
```bash
hwclock --systohc
```

## Localization
Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8` and other needed locales. Generate the locales by running:
```bash
locale-gen
```

Create the `locale.conf` file, and set the `LANG` variable accordingly
> /etc/locale.conf
```
LANG=en_US.UTF-8
```

Set keyboard layout
> /etc/vconsole.conf
```
KEYMAP=pt-latin9
```

## Network configuration
Set hostname
> /etc/hostname
```
myhostname
```

Add matching entries to `hosts`
> /etc/hosts
```
127.0.0.1   localhost
::1         localhost
127.0.1.1	myhostname.localdomain	myhostname
```

## Root password
```bash
passwd
```

## Boot loader
```bash
grub-install --target=i386-pc /dev/sdX
grub-mkconfig -o /boot/grub/grub.cfg
```

## Extras
Enable lightdm
```bash
systemctl enable lightdm
```
Enable Network Manager
```bash
systemctl enable NetworkManager
```

# Reboot
Exit chroot environment, unmount all the partitions and reboot the machine
```bash
exit
umount -R /mnt
reboot
```

# Tweaks After Reboot

## Enable Nouveau early KMS
> /etc/mkinitcpio.conf
```
MODULES=(nouveau)
```
Then
```bash
mkinitcpio -p linux
```

## Add new user
```bash
useradd -m -G wheel USERNAME
passwd
```

Allow members of group wheel sudo access. Uncomment `%wheel      ALL=(ALL) ALL`
```bash
EDITOR=nano visudo
```
visudo uncomment wheel

## Install Firefox
```bash
pacman -S firefox
```
