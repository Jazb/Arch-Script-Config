#!/bin/bash
if [[ -f `pwd`/funcs ]]; then
  source funcs
else
  echo "Archivo no disponible: funcs"
  exit 1
fi

host_name="Antibus"
ZONE="America"
SUBZONE="Caracas"
LOCALE_UTF8="es_VE.UTF-8"

arch_chroot "echo '${host_name}'>> /etc/hostname"
arch_chroot "sed -i '/127.0.0.1/s/$/ '${host_name}'/' /etc/hosts"
arch_chroot "sed -i '/::1/s/$/ '${host_name}'/' /etc/hosts"
arch_chroot "ln -s /usr/share/zoneinfo/${ZONE}/${SUBZONE} /etc/localtime"
arch_chroot "hwclock --systohc --utc"
arch_chroot "echo LANG='${LOCALE_UTF8}' >> /etc/locale.conf"
arch_chroot "echo 'KEYMAP=es' >> /etc/vconsole.conf"
arch_chroot "sed -i '/'${LOCALE_UTF8}'/s/^#//' /etc/locale.gen"
arch_chroot "locale-gen"