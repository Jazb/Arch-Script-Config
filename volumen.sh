#!/bin/bash

#Crear volumen LVM
lvm pvcreate /dev/mapper/enc-lvm
lvm vgcreate vg /dev/mapper/enc-lvm
lvm lvcreate -L 88G -n root vg
lvm lvcreate -C y -r n -L 12G -n swap vg
lvm lvcreate -l 100%FREE -n home vg
 
sync

#Crear sistema de archivos
mkfs.ext2 /dev/sda2 
mkfs.ext4 /dev/mapper/vg-root
mkfs.ext4 /dev/mapper/vg-home
mkswap -L "SWAP" -f /dev/mapper/vg-swap && swapon /dev/mapper/vg-swap 

#Optimizar sistema de archivos 
tune2fs -m 0 /dev/mapper/vg-home

#Montaje del sistema de archivos
mount /dev/mapper/vg-root /mnt
mkdir -p /mnt/{boot,home}
mount /dev/sda2 /mnt/boot
mount /dev/mapper/vg-home /mnt/home