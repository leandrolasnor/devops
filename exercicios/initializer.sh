sudo ufw enable

sudo curl https://releases.rancher.com/install-docker/20.10.sh | sh
sudo usermod -aG docker ubuntu

sudo nano /etc/sysctl.conf
#net.bridge.bridge-nf-call-iptables=1
sudo sysctl -p /etc/sysctl.conf 

sudo apt install zsh -y
sudo chsh -s /usr/bin/zsh

exit
#entry

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=powerlevel10k\/powerlevel10k/g' ~/.zshrc
sudo ufw allow from 10.0.0.0/24 to any port 22 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 80 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 443 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 2379 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 2380 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 6443 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 8443 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 8472 proto udp
sudo ufw allow from 10.0.0.0/24 to any port 9099 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 10250 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 10254 proto tcp
sudo ufw allow from 10.0.0.0/24 to any port 30000:32767 proto tcp
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F