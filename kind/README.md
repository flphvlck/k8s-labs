# Kind K8s Lab Cluster
Simple `Makefile` which creates lab cluster.

Prerequsites:
 - Kind
 - Kubectl
 - Helm

Run `make` with desired K8s version as a target.
```
Usage: make {1.30|1.31|1.31-ha|delete}
```

The resulting cluster:
  * named Lab1
  * 1 controle plane node (or 3 with `-ha` suffix), 2 worker nodes
  * CNI is Cilium
  * default enforcement of **restricted** Pod Security Standard (PSS) policy
    * use `pod-security.kubernetes.io` labels on namespace to elevate to other level of permissions
  * Kyverno - sets (mutates) all the fields necessary to pass the restricted policy
    * only if these fields are not already in place
  * Ingress NGINX Controller - port 80 and 443 published locally from `lab1-worker` node