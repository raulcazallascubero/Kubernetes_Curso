#Requisitos
#1. Docker con systemd y no con cgroups
#2. Desactivar swapping /etc/fstab swappoff -a
# 3. Instalar kubeadm, kubelet, y kube-proxy
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
sudo  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt install kubeadm -y
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
#Para añadir otras maquinas al cluster
#kubeadm join 172.31.30.152:6443 --token h89nfa.2dbql1r4h46rhk71 \
#	    --discovery-token-ca-cert-hash sha256:3727eb25cc8fb79746f6eaf23d8039576b9228f077a6980b8fe4699d3d38d464 
#Configurar red flannel
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

#Para pruebas y que nodo maestro pueda tener containers
#kubectl taint nodes --all node-role.kubernetes.io/master-

