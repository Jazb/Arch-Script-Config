#!/bin/bash

if [[ -f `pwd`/funcs ]]; then
  source funcs
else
  echo "Archivo no disponible: funcs"
  exit 1
fi

# Development packages
arch_chroot pacman -S --noconfirm ack autogen bash-completion bashdb boost clang \
  clang-analyzer clang-tools-extra cmake ctags dash dejagnu doxygen gdb \
  git linux-headers ltrace mercurial nasm nodejs subversion strace tcl \
  tcsh the_silver_searcher tig tk valgrind yasm zshdb zsh-completions \
  zsh-syntax-highlighting

# Documentation
arch_chroot pacman -S --noconfirm bash-docs gcc-docs linux-docs linux-howtos \
  man-pages-ru ruby-docs zsh-doc

# Networking
arch_chroot pacman -S --noconfirm dnsutils fping tcpdump traceroute vnstat whois

# Utilities
arch_chroot pacman -S --noconfirm asciidoc antiword aria2 bc cabextract calc catdoc \
  dos2unix htop imagemagick lesspipe libnotify lsof lynx markdown mc \
  mpg123 ranger rlwrap rsync sysstat tmux tree unrar unzip vifm \
  vbindiff w3m wget xmlto zip zsh

# Internationalization
arch_chroot pacman -S --noconfirm aspell-en aspell-ru aspell-uk libmythes mythes-en \
  hunspell hunspell-en hyphen hyphen-en

# Fonts
arch_chroot pacman -S --noconfirm ttf-bitstream-vera ttf-dejavu ttf-droid \
  ttf-ubuntu-font-family

# Themes
arch_chroot pacman -S --noconfirm numix-themes

# Xorg
arch_chroot pacman -S --noconfirm xorg-server xorg-server-utils xorg-xinit

# X utilities
arch_chroot pacman -S --noconfirm awesome gmrun numlockx vicious xorg-xprop xsel

# Applications
arch_chroot pacman -S --noconfirm firefox flashplugin gcolor2 gitg gnuplot \
  graphviz gucharmap gvim keychain meld p7zip qtcreator spacefm \
  viewnior zathura zathura-djvu zathura-pdf-poppler zathura-ps

# Packages from local repository
arch_chroot pacman -S --noconfirm cower dmenu-xft electricfence hunspell-ru \
  hunspell-uk hyphen-ru hyphen-uk simpleswitcher-git termite-git

# Cleanup arch_chroot pacman cache to reduce image size
arch_chroot pacman -Sc --noconfirm