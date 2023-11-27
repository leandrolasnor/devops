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
sudo rm -rf /home/ubuntu/ufw.sh
