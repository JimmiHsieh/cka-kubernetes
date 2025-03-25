MY_IP=192.168.65.27

sudo kubeadm init --apiserver-advertise-address=${MY_IP} --pod-network-cidr="10.244.0.0/16" --upload-certs


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config