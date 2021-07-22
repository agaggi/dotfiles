# Arch Linux Install (UEFI)

> Last revised 07/07/2021

Set system date, time, and timezone:

```bash
timedatectl set-ntp true
```

## Partitions

### fdisk

| Partition    | Size              |
| :----------: | :---------------: |
| `/boot/EFI`* | 700MB             |
| `/`          | 50GB              |
| `/home`      | Remainder of Disk |

\* After allocating disk space to the boot partition, press *t* to change the type of the 
partition to **1** (EFI)

### Creating Filesystems

```bash
mkfs.ext4 /dev/{root partition}
mkfs.ext4 /dev/{home partition}
mkfs.fat -F32 /dev/{boot partition}
```

### Mounting New Partitions

```bash
# /mnt will be where the Arch installation is built
mkdir -p /mnt/boot/EFI
mkdir /mnt/home

mount /dev/{root partition} /mnt
mount /dev/{home partition} /mnt/home
mount /dev/{boot partition} /mnt/boot/EFI
```

### pacstrap and /etc/fstab

```bash
pacstrap /mnt base base-devel linux linux-firmware neovim
genfstab -U /mnt >> /mnt/etc/fstab

# Enter your Arch installation 
arch-chroot /mnt
```

## Time and Locale

### Regional Time

```bash
ln -sf /usr/share/zoneinfo/{Region} /etc/localtime
hwclock --systohc
```

### Locale

1. Uncomment `en_US.UTF-8` in `/etc/locale.gen`
2. Create `/etc/locale.conf` and enter `LANG=en_US.UTF-8`
3. Edit `/etc/hostname` with your preferred hostname
    - If you edit, you need to change `/etc/hosts`:
        ```bash
        127.0.0.1   localhost
        ::1         localhost
        127.0.1.1   {hostname}.localdomain {hostname}
        ```

## Packages

**Note**: The 20 fastest mirrors are written in `/etc/pacman.d/mirrorlist` by a program 
called [reflector](https://wiki.archlinux.org/title/Reflector)

### Network

```bash
pacman -S networkmanager wpa_supplicant wireless_tools netctl dialog 
```

### Grub

```bash
pacman -S grub efibootmgr dosfstools os-prober mtools
```

### Graphics

- If you have an **Intel** CPU, install `intel-ucode` **instead** of `amd-ucode`.

```bash
pacman -S amd-ucode xorg-server mesa nvidia nvidia-utils
```

for AMD...

```bash
pacman -S intel-ucode xorg-server mesa
```

for a laptop without a discrete GPU as an example.

### Desktop Environment (KDE)

```bash
pacman -S sddm plasma
```

### Post-install packages

If you wait to do this, you will want to install a terminal (i.e. `alacritty`) **before** 
first booting into the fresh installation so you can run the following:

```bash
pacman -S --needed - < packages.txt
```

This will install all packages listed inside (except AUR ones).

## Automatically Enabling Services

```bash
systemctl enable NetworkManager
systemctl enable fstrim.timer
systemctl enable systemd-timesyncd
systemctl enable sddm
```

## Setting up Users

```bash
mkinitcpio -p linux

# Setting passwords and groups
passwd
useradd -m -g users -G wheel {username}
passwd {username}
```

### Adding Users to the Sudoers File

Enter the following:

```bash
EDITOR=nvim visudo
```

Then, uncomment `%wheel ALL=(ALL) ALL` to give your account root privileges.

## grub

```bash
# --bootloader-id={name} defines the name of the bootloader (ex: Windows 10)
grub-install --target=x86_64-efi --bootloader-id=Arch --recheck

# May already be present
mkdir /boot/grub/locale

cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
```

## Swapfile

```bash
# Turn off all swap processes
swapoff -a

# Resize swap (count representing 20GB)
dd if=/dev/zero of=/swapfile bs=1G count=20

# Change permission and make into swap
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```

Once created, ensure the following line is in your `/etc/fstab` file:

```bash
/swapfile   none    swap    sw  0   0
```

## Multilib

To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`:

```bash
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Then you can install (you **need** the two lib packages for steam to work right):

```bash
pacman -S lib32-nvidia-utils lib32-nvidia-libgl steam
```

## yay (AUR)

```bash
# Clone the repository
git clone https://aur.archlinux.org/yay.git

# Make ourselves the owner
sudo chown -R  {username}:users yay

# Then compile
cd yay
makepkg -si
```

Packages I install:

```bash
yay -S visual-studio-code-bin spotify zoom minecraft-launcher ttf-ms-fonts duf flutter
google-chrome
```

## Hibernation (optional)

To make it so your laptop doesn't crash when you close the lid...

```bash
yay -S hibernator update-grub
```

For additional reference, see [here](https://confluence.jaytaala.com/display/TKB/Use+a+swap+file+and+enable+hibernation+on+Arch+Linux+-+including+on+a+LUKS+root+partition).

```bash
sudo hibernator

# Make a backup of our grub config just in case
sudo cp /etc/default/grub /etc/default/grub.backup

# Find the start of the physical offset of /swapfile
sudo filefrag -v /swapfile
```

Then add the following to the grub config where `GRUB_CMDLINE_LINUX_DEFAULT` is:

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet resume=UUID=f68ed3c5-da10-4288-890f-b83d8763e85e resume_offset={physical offset}"
```
And update:

```bash
sudo update-grub
```

## Wrapping up

```bash
# Exit your build 
exit

# Unmount all partitions
umount -a
reboot
```
