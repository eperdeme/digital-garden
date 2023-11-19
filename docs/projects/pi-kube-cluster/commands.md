```
alias kube-vip="sudo ctr run --rm --net-host ghcr.io/kube-vip/kube-vip:v0.6.0 vip /kube-vip"
kube-vip manifest pod \
    --interface wlan0 \
    --vip 192.168.1.50 \
    --controlplane \
    --services \
    --arp \
    --leaderElection \
    --enableLoadBalancer | sudo tee /etc/kubernetes/manifests/kube-vip.yaml
```    

```
# Disable swap
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=0/g' /boot/cmdline.txt 

# enable cgroups memory

sudo sed -i '1s/^/cgroup_enable=memory /' /boot/cmdline.txt

# Install container package
sudo apt-get install -y containerd
containerd config default | sudo tee /etc/containerd/config.toml


# Set params for kube networking

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

lsmod | grep br_netfilter
lsmod | grep overlay
sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward



# Install kube tools 
sudo mkdir -p /etc/apt/keyrings
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://dl.k8s.io/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

```
cilium install  --set l7Proxy=false
```