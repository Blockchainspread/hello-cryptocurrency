#Clean old Debian package Repo
rm debian/Packages.gz

#Build Gamecredits Debian package
rm debian/gamecredits_i386.deb
chmod 0555 coins/gamecredits/DEBIAN/postinst
chmod 0777 coins/gamecredits/usr/bin/gamecreditsd
chmod 0777 coins/gamecredits/usr/bin/gamecredits-cli
dpkg-deb --build coins/gamecredits
mv coins/gamecredits.deb gamecredits_i386.deb
cp gamecredits_i386.deb debian/
rm gamecredits_i386.deb

#Build OkCash Debian package
rm debian/okcash_i386.deb
chmod 0555 coins/okcash/DEBIAN/postinst
chmod 0777 coins/okcash/usr/bin/okcashd
chmod 0777 coins/okcash/usr/bin/okcash
dpkg-deb --build coins/okcash
mv coins/okcash.deb okcash_i386.deb
cp okcash_i386.deb debian/
rm okcash_i386.deb

#Build Packages.gz
dpkg-scanpackages debian /dev/null | gzip -9c > debian/Packages.gz
