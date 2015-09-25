#!/bin/bash/
#@author Jay DiFuria @date Sep 17, 2015
##This script is meant for installing some basic tools required to compile
##the kernel source (as of stable 4.2). This script is meant for linux machines.

##It is recommended to have over 35 GB to ensure problem-free installs

##If you do not run this program as sudo,
####(1) the script will not work.
####(2) the script will request a password multiple times
####(3) the script will not be fully automated and you will waste your time

#--assume-yes source:http://linux.die.net/man/8/apt-get
#Automatic yes to prompts. Assume "yes" as answer to all prompts and run
#non-interactively. If an undesirable situation, such as changing a held
#package or removing an essential package, occurs then apt-get will abort.

#Variables
#exitStatus=()

##########

printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "::::::::::Kernel Pre-Compilation Set-Up Starting::::::::::::\n"
printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "**********Updating and Upgrading Packages*******************\n"

## apt-get update ##
  #Used to re-synchronize the package index files from their sources. The
  #indexes of available packages are fetched from the location(s) specified
  #in /etc/apt/sources.list(5). An update should always be performed before
  #an upgrade or dist-upgrade source:http://linux.die.net/man/8/apt-get
sudo apt-get update --assume-yes
#exitStatus[0]=$? #update array with whether or not command executed properly

## apt-get upgrade ##
  #apt-get upgrade will fetch new versions of packages existing on the
  #machine if APT knows about these new versions by way of apt-get update
  #source:http://linux.die.net/man/8/apt-get
sudo apt-get upgrade --assume-yes
#exitStatus[1]=$? #update array with whether or not command executed properly
printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "**********Installing basic server needs*********************\n"

## openssh-server ##
  #OpenSSH encrypts all traffic (including passwords) to effectively eliminate
  #eavesdropping, connection hijacking, and other attacks. Additionally,
  #OpenSSH provides secure tunneling capabilities and several authentication
  #methods, and supports all SSH protocol versions. source:http://www.openssh.com/
sudo apt-get install openssh-server --assume-yes

## curl ##
  #curl is an open source command line tool and library for transferring data
  #with URL syntax source:http://curl.haxx.se/
sudo apt-get install curl --assume-yes

## wget ##
  #GNU Wget is a free software package for retrieving files using HTTP, HTTPS and FTP
  #source: http://www.gnu.org/software/wget/
sudo apt-get install wget --assume-yes
## vim ##
  #Vim is an advanced text editor that seeks to provide the power of the
  #de-facto Unix editor 'Vi', with a more complete feature set
  #source: http://www.vim.org/about.php
sudo apt-get install vim --assume-yes
## git ##
  #Git is a free and open source distributed version control system designed to
  #handle everything from small to very large projects with speed and efficiency.
  #source: https://git-scm.com/
sudo apt-get install git --assume-yes
printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "**********Installing Kernel-Specific needs******************\n"

## libncurses5 ##
  #This package contains the shared libraries necessary to run programs
  #compiled with ncurses. source: https://packages.debian.org/wheezy/libncurses5
## libncurses5-dev ##
  #This package contains the header files, static libraries and symbolic links
  #that developers using ncurses will need.
  #source: https://packages.debian.org/wheezy/libncurses5-dev
## libnewt-dev ##
  #These are the header files and libraries for developing applications which use
  #newt. Newt is a windowing toolkit for text mode, which provides many widgets
  #and stackable windows. source: https://packages.debian.org/sid/libnewt-dev
sudo apt-get install libncurses5 libncurses5-dev libnewt-dev --assume-yes

## make ##
  #GNU Make is a tool which controls the generation of executables and other
  #non-source files of a program from the program's source files.
  #source: https://www.gnu.org/software/make/
  sudo apt-get install make --assume-yes

## gcc ##
  #The GNU Compiler Collection (GCC) is a compiler system produced by the GNU
  #Project supporting various programming languages.  C, C++, Objective-C,
  #Fortran, Java, Ada, and Go, as well as libraries for other languages
  #sources: https://en.wikipedia.org/wiki/GNU_Compiler_Collection
  #sources: https://gcc.gnu.org/
sudo apt-get install gcc --assume-yes
printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "**********Updating and Upgrading Packages*******************\n"

## apt-get update ##
  #Used to re-synchronize the package index files from their sources. The
  #indexes of available packages are fetched from the location(s) specified
  #in /etc/apt/sources.list(5). An update should always be performed before
  #an upgrade or dist-upgrade source:http://linux.die.net/man/8/apt-get
sudo apt-get update --assume-yes

## apt-get upgrade ##
  #apt-get upgrade will fetch new versions of packages existing on the
  #machine if APT knows about these new versions by way of apt-get update
  #source:http://linux.die.net/man/8/apt-get
sudo apt-get upgrade --assume-yes
printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "***********Kernel Necessities Complete**********************\n"
printf "**** It is important to follow the next steps carefully.****\n"
printf "************************************************************\n"
printf "(1) Download most recent stable kernel from www.kernel.org\n"
printf "(2) Move kernel file (linx-X.X.tar.xz) to the directory \n"
printf "///////$HOME\n"
printf "(3) Un-tar the file using tar -xvf <filename>\n"
printf "(4) Change Directory (cd) to your decompressed Kernel files\n"
printf "(5) Run 'sudo make menuconfig' and simply hit SAVE and EXIT\n"
printf "This will create a fresh .config file\n"
printf "***********************************************************\n"
printf "***WARNING****  NEXT STEP MAY TAKE 3+ HOURS  ****WARNING***\n"
printf "***********************************************************\n"
printf "(6) You may now compile the kernel.  ~3-5 hours.\n"
printf "To compile the kernel, go to your kernel directory and type\n"
printf "time sudo make\n"
printf "Would you like to download the stable 4.2 kernel? [y/n]"
read answer
##
if [ answer =~ [y|Y] ]; then
  sudo wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.2.tar.xz
  printf "Would you like to un-tar the 4.2 kernel in the current directory?"
  answer=xxxx
  read answer
  if [ answer =~ [y|Y] ]; then
    tar -xvf linux-4.2.tar.xz
  fi
fi
printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "::::::::::Kernel Pre-Compilation Set-Up Complete::::::::::::\n"
printf "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
printf "::::::::::Statistics::::::::::::::::::::::::::::::::::::::::\n"
printf ":::::Update...........:"
printf ":::::Upgrade..........:"
printf ":::::OpenSSH..........:"
printf ":::::curl.............:"
printf ":::::vim..............:"
printf ":::::git..............:"
printf ":::::libncurses5......:"
printf ":::::libncurses5-dev..:"
printf ":::::libnewt-dev......:"
printf ":::::make.............:"
printf ":::::gcc..............:"
printf ":::::Update...........:"
printf ":::::Upgrade..........:"
