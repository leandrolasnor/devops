#!/bin/bash
sleep 180
sudo apt install net-tools
sudo curl https://releases.rancher.com/install-docker/20.10.sh | sh
sudo usermod -aG docker ubuntu
sudo sed -i -e '$anet.bridge.bridge-nf-call-iptables=1' /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F
if [ $(hostname) == "rancher-server" ]
then
  sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 -v /opt/rancher:/var/lib/rancher --privileged rancher/rancher:latest
fi
sudo rm -rf /home/ubuntu/setup.sh
exit 0