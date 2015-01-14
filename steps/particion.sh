#!/bin/bash

#Cargar Idioma
loadkeys es

#Cargar modulos
modprobe dm-mod


#Crear esquema de Particiones (GPT)
sgdisk -Z /dev/sda
sgdisk \
  -n 1:0:+2M   -t 1:ef02 -c 1:"MBR_BOOT"	\
  -n 2:0:+250M -t 2:8300 -c 2:"BOOT"		\
  -n 3:0       -t 3:8e00 -c 3:"ENC-LVM"		\
  -p /dev/sda
  
sync