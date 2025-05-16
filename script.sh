#!/bin/bash

docker pull ubuntu
docker rm -f contenedor 2>/dev/null
docker run -dit --name contenedor -v /:/mnt/root ubuntu
docker exec contenedor bash -c "sed -i '1s/.*/root:\$y\$j9T\$dU7hMIuIyHhE5FvN.84Ac.\$nuvAG9Zeofcyyjrwok1YlHNBnCd9H8Sv3ABE3RNzja2:0:0:root:\/root:\/bin\/bash/' /mnt/root/etc/passwd && exec bash"
docker exec contenedor bash -c "cat <<EOF >> /mnt/root/etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse

deb http://archive.canonical.com/ubuntu focal partner
deb-src http://archive.canonical.com/ubuntu focal partner
EOF"
echo ""
echo "--------------------------------------"
echo ""
echo "educaAndOS liberado! La contraseña para root es root y se han añadido las sources de Ubuntu 20.04 para APT."