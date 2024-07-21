#!/usr/bin/env bash
SUITE=bookworm
TARGET=/tmp/$SUITE
echo "Create a $SUITE chroot environment with python3.11 into $TARGET,"
echo "useful (only) when you want an environment with newer 'ldd --version'."
echo "It will also mount current directory (`pwd`) as /project inside the chroot environment."
echo "Run this script only once, with sudo."

# The script is derived from https://www.linode.com/docs/guides/use-chroot-for-testing-on-ubuntu/
apt install -y debootstrap
if [ $? -ne 0 ]; then
    echo "An error occurred. Did you forget to run this script with sudo?"
    exit 1
fi

mkdir -p $TARGET

# 2xx MB
debootstrap $SUITE $TARGET

chroot $TARGET apt install python3 python3.11-venv -y

# Need 439 MB
chroot $TARGET apt install python3-pip -y

chroot groupadd -g $(id -g) $(id -gn)
chroot useradd -u $(id -u) -g $(id -g) -m $(id -un)

# X11 needs this to solves
# GLFW Error 65550: X11: Failed to open display :0.0
mount --bind /tmp $TARGET/tmp

echo "Mounting current directory (`pwd`) as /project inside the chroot environment..."
mkdir -p $TARGET/project
mount --bind `pwd` $TARGET/project
echo "CAVEAT: You probably need to umount first before you delete $TARGET !"

echo "Chroot environment setup successfully."
echo "Now run the following command to enter the chroot environment."
echo "chroot --userspec=$(id -un):$(id -gn) $TARGET bash"
#chroot --userspec=$(id -un):$(id -gn) $TARGET bash

