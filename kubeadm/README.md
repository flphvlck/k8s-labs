# Vagrant K8s Lab Cluster
Simple `Makefile` which creates lab cluster.

This lab environment is quite heavy on resources (you were warned). Doesn't work on Macs with Apple Silicon CPU.

Prerequsites:
 - Vagrant
 - VirtualBox

Run `make` with desired K8s version as target (eventually with `-ha` option for HA control plane):
```
Usage: make {1.31|1.31-ha|destroy}
```

The resulting cluster:
  * named Lab1
  * 1 or 3 controle plane nodes (HA control plane), 2 worker nodes, 1 proxy server for control plane and ingress LB
    * every node has two network interfaces
      * NAT to communicate outside
      * Host-only Network to communicate with each other and hosting machine
  * CNI is Cilium
  * default enforcement of **restricted** Pod Security Standard (PSS) policy
    * use ``pod-security.kubernetes.io`` labels on namespace to elevate to other level of permissions
  * Kyverno - sets (mutates) all the fields necessary to pass the restricted policy
    * only if these fields are not already in place
  * Ingress and k8s api ports (80, 443, 6443) availaible via LB ip address 192.168.56.80

Host-only Network:
  * range ``192.168.56.0/24``
  * dns records are valid for this network range only
  * hosts fqdn DNS names and ips:
    * proxy1.lab.hvlck.xyz - ``192.168.56.80``
    * cp1.lab.hvlck.xyz - ``192.168.56.81``
    * cp1.lab.hvlck.xyz - ``192.168.56.82``
    * cp2.lab.hvlck.xyz - ``192.168.56.83``
    * w1.lab.hvlck.xyz - ``192.168.56.84``
    * w2.lab.hvlck.xyz - ``192.168.56.85``

Access cluster:
  * ``kubeconfig`` in lab directory downloaded from ``cp1`` node
  * k8s api endpoint: ``lab1-api.lab.hvlck.xyz``
