# Derived from official https://docs.docker.com/engine/install/debian/#install-using-the-repository
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "Required workaround for antiX Live USB's demo account"
sudo echo '{"data-root":"/home/demo/Live-usb-storage/docker"}' > /etc/docker/daemon.json

# Optionally, add your current user into docker group to run Docker commands without sudo
sudo usermod -aG docker $USER
echo "Logout and login again, to allow you run docker without sudo"
echo ""
echo "Optional: See more post-installation from the official doc"
echo "https://docs.docker.com/engine/install/linux-postinstall/"
