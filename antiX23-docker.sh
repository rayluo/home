# Derived from https://www.antixforum.com/forums/topic/installing-docker-on-antix/

echo "Run this script with sudo"
apt update

## Seems unnecessary
# apt upgrade
# apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL http://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] http://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io elogind libpam-elogind
service docker start
echo "You will still need to do Linux Post-Install https://docs.docker.com/engine/install/linux-postinstall/"
