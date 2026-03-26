# K3s-Production-Cluster-with-Cloudflare-Tunnel
## Accessing Services from Private Kubernetes Cluster Using Cloudflared Tunnel
  <img src="./Assets/accessingServicesfromPrivateKubernetesClusterUsingCloudflaredTunnel.png" width=1200px height=600px>

- Here we will run private Kubernetes cluster in local VM provisioned using Vagrantfile.
- We have no static Public IP for our Kubernetes Node.
- We are behind CGNAT.

### What This Project Does
- Deploys a multi-node K3s cluster (Vagrant + KVM)
- Uses Cloudflare Tunnel to expose services securely
- Implements Traefik for Ingress & Gateway API
- Supports HTTP, HTTPS, and TCP (e.g., PostgreSQL)
- Uses Calico (CNI) and Kube-VIP (LoadBalancer + HA-ready)

### Use Cases
- Homelab Kubernetes setup
- Running clusters behind CGNAT
- Secure service exposure without port forwarding
- Testing production-like environments locally

### Full Walkthrough

- Complete step-by-step guide available here: https://dl.surf/@thespiritman/accessing-services-from-private-kubernetes-cluster-using-cloudflared-tunnel

This includes:
- Cluster provisioning
- CNI setup (Calico)
- Kube-VIP configuration
- Traefik setup
- Cloudflare Tunnel (HTTP, HTTPS, TCP)
- TLS configuration