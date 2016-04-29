#!/bin/bash

#./update.sh coinname

#Clean old Debian package Repo
rm debian/Packages.gz

#Build Debian package
rm debian/$1_i386.deb
chmod 0555 coins/$1/DEBIAN/postinst
chmod 0777 coins/$1/usr/bin/$1d
chmod 0777 coins/$1/usr/bin/$1-cli
dpkg-deb --build coins/$1
mv coins/$1.deb $1_i386.deb
cp $1_i386.deb debian/
rm $1_i386.deb

#Build Debian package 
rm debian/$1_armel.deb
chmod 0555 coins/$1/DEBIAN/postinst
chmod 0777 coins/$1/usr/bin/$1d
chmod 0777 coins/$1/usr/bin/$1-cli
dpkg-deb --build coins/$1-arm
mv coins/$1-arm.deb $1_armel.deb
cp $1_armel.deb debian/
rm $1_armel.deb

#Build Packages.gz
dpkg-scanpackages debian /dev/null | gzip -9c > debian/Packages.gz
