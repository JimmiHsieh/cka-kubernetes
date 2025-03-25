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

## Quick Start

1. Launch the VMs:
```bash
cd multipass
./lanuch-2vm.sh
```

2. SSH into the master node:
```bash
./ssh-cka-master.sh
```

3. On the master node, run the installation scripts:
```bash
cd /home/ubuntu/cka-master
./install-all.sh
./kubeadm-init.sh
```

4. SSH into the worker node:
```bash
./ssh-cka-node1.sh
```

5. On the worker node, run the installation scripts:
```bash
cd /home/ubuntu/cka-nodes
./install-all.sh
```

## Configuration Details

### Kubernetes Version
- Version: 1.32

### Network Configuration
- Pod Network CIDR: 10.244.0.0/16
- Container Runtime: containerd
- SystemdCgroup: enabled

### VM Specifications
- Master Node: 2 CPUs, 2GB RAM
- Worker Node: 2 CPUs, 2GB RAM
- Network: Using host network (en0)

## Cleanup

To remove all VMs and clean up:
```bash
cd multipass
./destroy.sh
```

## Notes

- The scripts are designed for Ubuntu-based systems
- All scripts require sudo privileges
- Make sure to replace the IP address in `kubeadm-init.sh` with your master node's IP
- The setup is optimized for CKA exam preparation

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.