# RKE2 K8s Lab Cluster
Simple `Makefile` which creates lab cluster.

Prerequsites:
 - Lima: https://github.com/lima-vm/lima
 - Kubectl
 - edit mount location in `rke2-server.yaml` and `rke2-agent.yaml`
```
mounts:
- location: "real-path-to/k8s-labs/rke2/lima-rke2-mount"
  mountPoint: "/tmp/lima-rke2-mount"
  writable: true
```

Run `make create-X.Y` with desired K8s version as a target or `make create` to use stable RKE2 channel (https://update.rke2.io/v1-release/channels).
```
Usage: make {create|create-(1.30|1.31|1.32)|start|stop|delete}
```

The resulting cluster:
  * 1 controle plane (server) node, 1 worker (agent) node
  * CNI is Cilium
  * Ingress NGINX Controller - port 80 and 443 published locally from agent node

**Kubeconfig**

It doesn't manipulate usual `~/.kube/config`. Instead the kubeconfig from server node is saved in your home directory.
```
export KUBECONFIG="${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"
kubectl get nodes
```