#!/bin/bash
sudo curl https://releases.rancher.com/install-docker/20.10.sh | sh
sudo usermod -aG docker ubuntu
sudo sed -i -e '$anet.bridge.bridge-nf-call-iptables=1' /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
if [ $(hostname) == "rancher-server" ]
then
  sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 -v /opt/rancher:/var/lib/rancher --privileged rancher/rancher:stable
fi
sudo apt install zsh -y
sudo chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=powerlevel10k\/powerlevel10k/g' ~/.zshrc
sudo rm -rf /home/ubuntu/setup.sh