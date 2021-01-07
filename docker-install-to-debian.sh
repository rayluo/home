if [ -z $1 ]
    then
        echo "Usage: $0 buster|strech|..."
        echo "You need to specify one of the Debian Release code name,"
        echo "based on https://wiki.debian.org/DebianReleases#Production_Releases"
        echo "FYI: antiX/MX Linux 19 is based on Debian code name buster."
        echo "     antiX/MX Linux 18 is based on Debian code name strech."
        exit 1;
fi

# Derived from https://www.how2shout.com/how-to/how-to-install-docker-ce-on-mx-linux.html

# Update Debian-based system
sudo apt update
cd /tmp

# Setup Docker repository key
wget -O docker.gpg https://download.docker.com/linux/debian/gpg

# Verify and add Docker repo-key to apt’s keyring
gpg --keyid-format 0xlong docker.gpg 2>/dev/null | grep -sq 0x8D81803C0EBFCD88 && sudo apt-key add docker.gpg

# Add Docker repo into current distro
echo "deb [arch=amd64] https://download.docker.com/linux/debian $1 stable" | sudo tee /etc/apt/sources.list.d/docker.list

# After adding the repo, again run system update command,
# so that it can recognize the added repo and purge the cache.
sudo apt update

# Finally, install docker engine
sudo apt install docker-ce

# Optionally, add your current user into docker group to run Docker commands without sudo
sudo usermod -aG docker $USER
echo "Logout and login again, to allow you run docker without sudo"
echo ""
echo "Optional: See more post-installation from the official doc"
echo "https://docs.docker.com/engine/install/linux-postinstall/"

