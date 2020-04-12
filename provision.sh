#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

user="vagrant"
if [ "$1" != "" ]; then
        user=$1
fi

sed -i 's|http://us.|http://|g' /etc/apt/sources.list

timedatectl set-timezone Europe/London

apt-get remove -yq snapd

# On non-Hyper-V disable the Hyper-V daemons. They're not playing ball properly and shouldnt really be here.
if [[ $(dmidecode -s system-product-name) != "Virtual Machine" && $(dmidecode -s system-manufacturer != "Microsoft Corporation") ]]
then
  # Not Hyper-V. Ensure the Hyper-V tools are missing to prevent start up delays.
  apt-get remove -yq linux-cloud-tools-common
else
  # We're on Hyper-V
  
  # Disable DNSSEC under HyperV
  # I'm getting issues, possibly due to the NAT switch fiddling with packets?
  if ! grep -Fxq "DNSSEC=no" /etc/systemd/resolved.conf
  then
    echo DNSSEC=no >> /etc/systemd/resolved.conf
    systemctl restart systemd-resolved
  fi
fi

# add the git ppa to get the latest git, rather than what LTS ships with
add-apt-repository ppa:git-core/ppa

# update and upgrade
apt-get -yq update
apt-get -yq upgrade

# pull in anything that we may be missing
apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    build-essential \
    python \
    python-pip \
    samba \
    acl \
    inotify-tools \
    git

# install docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get -yq update
apt-get install -yq docker-ce

# add the user to the docker group so they dont need to keep running through sudo
usermod -a -G docker $user

# grab docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# fixes issue specific to Hyper-V and docker-compose forwarding
sysctl -w net.ipv6.conf.all.forwarding=1
echo net.ipv6.conf.all.forwarding=1 >> /etc/sysctl.conf

# make sure we have our default path created
mkdir -p /home/$user/Code

if [ $user == "vagrant" ]; then
    # vagrant specific stuff. 
    # this'll have to do for now.

    # add a network persistent network share for /home/vagrant/Code
    net usershare add code /home/$user/Code "~/Code Share" everyone:F guest_ok=yes
    net usershare info --long=code /var/lib/samba/usershares/code
    
    # insecure. This'll have to do for now.
    chmod -R a+rwx /home/$user/Code
    setfacl -m "default:other:rwx" /home/$user/Code
fi