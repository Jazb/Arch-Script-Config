#!/bin/bash

pacstrap /mnt abs base base-devel grub os-prober networkmanager xf86-input-synaptics iw wireless_tools wpa_actiond wpa_supplicant dialog alsa-utils espeakup brltty parted btrfs-progs openssh net-tools ntp git vim fish tmux
genfstab -p -U /mnt >> /mnt/etc/fstab


