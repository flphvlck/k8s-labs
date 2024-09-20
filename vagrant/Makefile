help:
	@echo "Usage: make {1.31|1.31-ha|destroy}"

ssh-key-create:
	[ -f ssh/sshkey ] || ssh-keygen -C "k8s lab" -t ed25519 -f ssh/id_ed25519 -P ""

1.31: ssh-key-create
	vagrant up proxy1 cp1 w1 w2
	vagrant ssh cp1 -c "sudo cat /etc/kubernetes/admin.conf" > kubeconfig

1.31-ha: ssh-key-create
	vagrant up
	vagrant ssh cp1 -c "sudo cat /etc/kubernetes/admin.conf" > kubeconfig

destroy:
	rm -f ssh/sshkey ssh/sshkey.pub
	vagrant destroy -f

# vim: set noexpandtab:
