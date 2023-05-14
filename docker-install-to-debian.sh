echo "Nowadays you can install docker-ce etc. from antiX 21+'s Synaptic Package Manager."
echo "Install it first, and then continue with this script for post-install tuning."
read -s -p "Press ENTER to continue..."

echo "Required workaround for antiX Live USB's demo account"
sudo echo '{"data-root":"/home/demo/Live-usb-storage/docker"}' > /etc/docker/daemon.json

# Optionally, add your current user into docker group to run Docker commands without sudo
sudo usermod -aG docker $USER
echo "Logout and login again, to allow you run docker without sudo"
echo ""
echo "Optional: See more post-installation from the official doc"
echo "https://docs.docker.com/engine/install/linux-postinstall/"
