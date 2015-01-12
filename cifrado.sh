#!/bin/bash

#Cifrar particion /dev/sdX3
cryptsetup -c serpent-xts-plain64 -s 512 -h whirlpool -i 20000 luksFormat /dev/sda3 
cryptsetup luksOpen /dev/sda3 enc-lvm 
