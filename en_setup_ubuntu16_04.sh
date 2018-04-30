#!/bin/sh

CURRENTPATH=$(pwd)

# 1. Install Binutils/Essentials/wget/git

sudo apt-get install -y gcc gdb build-essential binutils binutils-powerpc-linux-gnu binutils-multiarch wget git

# 2. Install other dependencies

sudo apt-get install -y libpcap-dev uml-utilities libelf-dev libelf1 zlib1g zlib1g-dev

# 3. Install hex editor

sudo apt-get install -y ht hexedit

# 4. Install dynamips & gdb stub


# 5. Install pcalc(Programmer Caculator)

git clone https://github.com/vapier/pcalc
# This software depends on bison and flex, you need to install them first
sudo apt-get install -y bison flex
cd pcalc
make
sudo make install
cd ../

# 6. Install QEMU

sudo apt-get install -y qemu qemu-system qemuctl qemu-system-mips qemu-system-misc qemu-system-ppc qemu-system-x86

# Get other components for qemu

cd /usr/share/qemu
sudo mkdir ../openbios/
sudo mkdir ../slof/
sudo mkdir ../openhackware/
cd ../openbios
sudo wget https://github.com/qemu/qemu/raw/master/pc-bios/openbios-ppc
sudo wget https://github.com/qemu/qemu/raw/master/pc-bios/openbios-sparc32
sudo wget https://github.com/qemu/qemu/raw/master/pc-bios/openbios-sparc64
cd ../openhackware
sudo wget https://github.com/qemu/qemu/raw/master/pc-bios/ppc_rom.bin
cd ../slof
sudo wget https://github.com/qemu/qemu/raw/master/pc-bios/slof.bin
sudo wget https://github.com/qemu/qemu/raw/master/pc-bios/spapr-rtas.bin

# Switch to the setup directory
cd $CURRENTPATH

# 7. Get Debian PowerPC Image


# 8. Install oh_my_zsh

sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 9. Add i386
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get -y install libc6:i386 libstdc++6:i386
