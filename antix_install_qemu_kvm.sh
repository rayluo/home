sudo apt update

# Part 1: This part is expected to be sufficient to support docker

# Derived from https://github.com/sickcodes/Docker-OSX#initial-setup
# UBUNTU DEBIAN
sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager libguestfs-tools -y \
&& sudo service libvirtd start \
&& sudo service virtlogd start

# See more on ignore_msrs from here: https://patchwork.kernel.org/project/kvm/patch/1250686963-8357-38-git-send-email-avi@redhat.com/
echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs
sudo modprobe kvm

# To solver the error: authentication unavailable: no polkit agent available to authenticate action 'org.libvirt.unix.manage'
# Solution from here: https://bugzilla.redhat.com/show_bug.cgi?id=1437933#c2
sudo usermod --append --groups libvirt `whoami`


# PART 2: Attempting to use Virtual Machine Manager

# To solve this error when starting a VM from Virtual Machine Manager:
# 	Error connecting to graphical console: Error opening Spice console, SpiceClientGtk missing
# Derived from MX forum post "To KVM or not to KVM" https://forum.mxlinux.org/viewtopic.php?t=54929
sudo apt install gir1.2-spiceclientgtk-3.0 -y

# By default, Virtual Machine Manager wants to use a "default" network interface,
# which needs dnsmasq to work.
# However, dnsmasq installation would override your working /etc/resolv.conf with a non-working placeholder.
# So, we backup and then restore the old one.
cp /etc/resolv.conf /tmp
sudo apt install dnsmasq -y
sudo cp /tmp/resolv.conf /etc

# Potentially useful resources:
# Official KVM wiki: https://wiki.debian.org/KVM

# Note: A QEMU/KVM virtual machine is 20% faster than a VirtualBox VM running on my same box.
# We might be able to run some CPU benchmark online here: https://cpux.net/cpu-benchmark-online/r5m7x
