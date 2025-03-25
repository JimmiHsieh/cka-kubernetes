IP_ADDR=$(ip addr show enp0s1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')


sudo kubeadm init --apiserver-advertise-address=${IP_ADDR} --pod-network-cidr="10.244.0.0/16" --upload-certs


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config