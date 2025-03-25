# CKA Kubernetes Setup

This repository contains scripts for setting up a Kubernetes cluster using Multipass for local development and testing. The setup includes a master node and worker nodes with all necessary configurations for the Certified Kubernetes Administrator (CKA) exam preparation.

## Prerequisites

- macOS (tested on macOS 14.3)
- Multipass installed
- Git

## Project Structure

```
.
├── cka-master/           # Master node setup scripts
│   ├── install.sh       # Kubernetes installation
│   ├── containerd.sh    # Container runtime setup
│   ├── install-all.sh   # Run all installation scripts
│   └── kubeadm-init.sh  # Initialize Kubernetes cluster
├── cka-nodes/           # Worker nodes setup scripts
│   ├── install.sh       # Kubernetes installation
│   ├── containerd.sh    # Container runtime setup
│   └── install-all.sh   # Run all installation scripts
└── multipass/           # Multipass VM management scripts
    ├── lanuch-2vm.sh    # Launch master and worker VMs
    ├── destroy.sh       # Clean up all VMs
    ├── ssh-cka-master.sh # SSH into master node
    └── ssh-cka-node1.sh  # SSH into worker node
```

## Quick Start Guide

### 1. Launch Virtual Machines
```bash
cd multipass
./lanuch-2vm.sh
```

### 2. Configure Master Node
1. SSH into the master node:
```bash
./ssh-cka-master.sh
```

2. Clone the repository and run installation scripts:
```bash
git clone https://github.com/JimmiHsieh/cka-kubernetes
cd cka-kubernetes/cka-master
chmod +x * && ./install-all.sh
```

3. Deploy Flannel CNI:
```bash
kubectl apply -f https://github.com/flannel-io/flannel/releases/download/v0.26.5/kube-flannel.yml
```

### 3. Configure Worker Node
1. SSH into the worker node:
```bash
./ssh-cka-node1.sh
```

2. Clone the repository and run installation scripts:
```bash
git clone https://github.com/JimmiHsieh/cka-kubernetes
cd cka-kubernetes/cka-nodes
chmod +x * && ./install-all.sh
```

## System Configuration

### Kubernetes Setup
- Version: 1.32
- Container Runtime: containerd
- SystemdCgroup: enabled

### Network Configuration
- Pod Network CIDR: 10.244.0.0/16
- CNI: Flannel
- Network Interface: en0 (configurable)

### Virtual Machine Resources
- Master Node: 2 CPUs, 2GB RAM
- Worker Node: 2 CPUs, 2GB RAM

## Important Notes

### Prerequisites
- All scripts require sudo privileges
- Designed for Ubuntu-based systems
- Ensure sufficient disk space for VM creation

### Configuration
- Update network interface name in `kubeadm-init.sh` (default: enp0s1)
- Modify Pod CIDR in `kubeadm-init.sh` if needed (default: 10.244.0.0/16)

### Troubleshooting
- If VMs fail to start, check Multipass installation
- For network issues, verify interface names in scripts
- Ensure all scripts have execute permissions

## Cleanup

To remove all VMs and clean up resources:
```bash
cd multipass
./destroy.sh
```

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.