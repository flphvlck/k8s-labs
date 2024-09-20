help:
	@echo "Usage: make {1.30|1.31|1.31-ha|delete}"

kind-create:
	kind create cluster --config kind-cluster-$(MAKECMDGOALS).yaml

post-create:
	kubectl label namespaces local-path-storage pod-security.kubernetes.io/audit=privileged pod-security.kubernetes.io/enforce=privileged pod-security.kubernetes.io/warn=privileged
	helm repo add --force-update cilium https://helm.cilium.io
	helm repo add --force-update kyverno https://kyverno.github.io/kyverno
	helm repo add --force-update ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo update
	kubectl -n kube-system patch daemonset kube-proxy -p '{"spec":{"template":{"spec":{"nodeSelector":{"non-existing": "true"}}}}}'
	helm upgrade --install cilium cilium/cilium --namespace kube-system --values cilium_values.yaml
	kubectl -n kube-system rollout status daemonset cilium -w
	helm upgrade --install kyverno kyverno/kyverno --namespace kyverno --create-namespace --values kyverno_values.yaml
	kubectl -n kyverno rollout status deployment kyverno-admission-controller -w
	kubectl apply -f manifests/kyverno-policies
	helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace --values ingress-nginx_values.yaml


1.30: kind-create post-create

1.31: kind-create post-create

1.31-ha: kind-create post-create
    
delete:
	kind delete cluster --name lab1

# vim: set noexpandtab:
