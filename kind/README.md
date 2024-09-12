# Kind K8s Lab Cluster

```
Usage: make {1.30|1.31|delete}
```

Use `make` with desired K8s version as a target.

It creates lab cluster named **lab1**:
  * 1 controle plane node, 2 worker nodes
  * CNI is Cilium
  * default enforcement of **restricted** Pod Security Standard (PSS) policy
    * use ``pod-security.kubernetes.io`` labels on namespace to elevate to other level of permissions
  * Kyverno - sets (mutates) all the fields necessary to pass the restricted policy
    * only if these fields are not already in place
  * Ingress NGINX Controller - port 80 and 443 published locally from ``lab1-worker`` node