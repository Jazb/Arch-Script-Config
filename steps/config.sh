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

## Configuraciones basicas
arch_chroot "echo '${host_name}'>> /etc/hostname"
arch_chroot "sed -i '/127.0.0.1/s/$/ '${host_name}'/' /etc/hosts"
arch_chroot "sed -i '/::1/s/$/ '${host_name}'/' /etc/hosts"
arch_chroot "ln -s /usr/share/zoneinfo/${ZONE}/${SUBZONE} /etc/localtime"
arch_chroot "hwclock --systohc --utc"
arch_chroot "echo LANG='${LOCALE_UTF8}' >> /etc/locale.conf"
arch_chroot "echo 'KEYMAP=es' >> /etc/vconsole.conf"
arch_chroot "sed -i '/'${LOCALE_UTF8}'/s/^#//' /etc/locale.gen"
arch_chroot "locale-gen"

## Configuraciones de Kernel, init y Grub
arch_chroot "sed -i '/^MODULES/s/""/"lzo tuxonice_compress tuxonice_swap tuxonice_userui"/' /etc/mkinitcpio.conf"
arch_chroot "sed -i '/^HOOK/s/block/block keymap encrypt/' /etc/mkinitcpio.conf"
arch_chroot "sed -i '/^HOOK/s/filesystems/lvm2 userui resume filesystems/' /etc/mkinitcpio.conf"
arch_chroot "mkinitcpio -p linux-pf"

sed -i 's/#[multinit/[multibit]'
sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/' /etc/default/grub

arch_chroot "grub-install --target=i386-pc --recheck --debug ${BOOT_MOUNTPOINT}"
arch_chroot "grub-mkconfig -o /boot/grub/grub.cfg"
