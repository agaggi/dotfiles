# Arch Linux Install (UEFI)

> Last revised 12/31/2020

Set system date, time, and timezone:

```bash
timedatectl set-ntp true
```

## Partitions

### fdisk

| Partition    | Size              |
| :----------: | :---------------: |
| `/boot/EFI`* | 700MB             |
| `/`          | Remainder of disk |

\* After allocating disk space to the boot partition, press *t* to change the type of the partition to **1** (EFI)

### Creating Filesystems

```bash
mkfs.ext4 /dev/{root partition}
mkfs.fat -F32 /dev/{boot partition}
```

### Mounting New Partitions

```bash
mount /dev/{root partition} /mnt
mkdir -p /mnt/boot/EFI
mount /dev/{boot partition} /mnt/boot/EFI
```

### pacstrap and /etc/fstab

```bash
pacstrap /mnt base base-devel linux linux-firmware vim
genfstab -U /mnt >> /mnt/etc/fstab

# Enter your build of Arch Linux 
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

## Packages (The ones I install)

### Network

```bash
pacman -S networkmanager wpa_supplicant wireless_tools netctl dialog 
```

### Grub

```bash
pacman -S grub efibootmgr dosfstools os-prober mtools
```

### Graphics

- If you have an Intel CPU, install `intel-ucode` instead of `amd-ucode`
- You sould install `lib32-nvidia-utils` and `lib32-nvidia-libgl` once you have *multilib* enabled for *Steam*

```bash
pacman -S amd-ucode xorg-server mesa nvidia nvidia-utils
```

### Desktop Environment (KDE)

```bash
pacman -S sddm plasma
```

### Fonts

```bash
pacman -S ttf-ubuntu-font-family ttf-sazanami ttf-baekmuk ttf-hannom
```

### Everything Else

```bash
pacman -S discord jdk-openjdk gradle neofetch git tree htop cmake firefox vlc libreoffice-fresh obs-studio partitionmanager konsole dolphin chromium python-pip spectacle wget unzip ntfs-3g openssh
```

Note: *Steam* is in the *multilib* library and needs to be enabled.

## Automatically Enabling Services

```bash
systemctl enable NetworkManager
systemctl enable fstrim.timer
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

```bash
EDITOR=vim visudo
```

Then, uncomment `%wheel ALL=(ALL) ALL` to give your account root privileges.

## grub

```bash
grub-install --target=x86_64-efi --bootloadere-id=Arch --recheck

mkdir /boot/grub/locale

cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
```

## Swapfile

```bash
# Turn off all swap processes
swapoff -a

# Resize swap (count representing 17GB)
dd if=/dev/zero of=/swapfile bs=1G count=17

# Change permission and make into swap
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```

Ensure the following line is in your `/etc/fstab` file:

```bash
/swapfile   none    swap    sw  0   0
```

## Multilib

To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`:

```bash
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Then you can install:

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
yay -S visual-studio-code-bin spotify zoom minecraft-launcher ttf-ms-fonts ttf-twemoji
```

### Hibernation (optional)

And specifically for laptops so **hibernation** works...

```bash
yay -S hibernator update-grub
```

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
```