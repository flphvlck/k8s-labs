help:
	@echo "Usage: make {create|create-(1.30|1.31|1.32)|start|stop|delete}"

create:
	echo INSTALL_RKE2_CHANNEL=stable > lima-rke2-mount/rke2-channel
	limactl start --name=rke2-server-1 --tty=false rke2-server.yaml
	sed -i "s/default/rke2-lab/g" "${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"
	limactl start --name=rke2-agent-1 --tty=false rke2-agent.yaml
	@echo To use rke2-lab cluster run: export KUBECONFIG="${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"

create-1.30:
	echo INSTALL_RKE2_CHANNEL=v1.30 > lima-rke2-mount/rke2-channel
	limactl start --name=rke2-server-1 --tty=false rke2-server.yaml
	sed -i "s/default/rke2-lab/g" "${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"
	limactl start --name=rke2-agent-1 --tty=false rke2-agent.yaml
	@echo To use rke2-lab cluster run: export KUBECONFIG="${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"

create-1.31:
	echo INSTALL_RKE2_CHANNEL=v1.31 > lima-rke2-mount/rke2-channel
	limactl start --name=rke2-server-1 --tty=false rke2-server.yaml
	sed -i "s/default/rke2-lab/g" "${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"
	limactl start --name=rke2-agent-1 --tty=false rke2-agent.yaml
	@echo To use rke2-lab cluster run: export KUBECONFIG="${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"

create-1.32:
	echo INSTALL_RKE2_CHANNEL=v1.32 > lima-rke2-mount/rke2-channel
	limactl start --name=rke2-server-1 --tty=false rke2-server.yaml
	sed -i "s/default/rke2-lab/g" "${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"
	limactl start --name=rke2-agent-1 --tty=false rke2-agent.yaml
	@echo To use rke2-lab cluster run: export KUBECONFIG="${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"

start:
	limactl list 2>&1 | grep -q -E "rke2-server-1[[:space:]]+Stopped" && limactl start --name=rke2-server-1 --tty=false
	sed -i "s/default/rke2-lab/g" "${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"
	limactl list 2>&1 | grep -q -E "rke2-agent-1[[:space:]]+Stopped" && limactl list rke2-agent-1 && limactl start --name=rke2-agent-1 --tty=false
	@echo To use rke2-lab cluster run: export KUBECONFIG="${HOME}/.lima/rke2-server-1/copied-from-guest/kubeconfig.yaml"


stop:
	limactl stop rke2-server-1
	limactl stop rke2-agent-1
    
delete:
	limactl stop -f rke2-server-1
	limactl delete rke2-server-1
	limactl stop -f rke2-agent-1
	limactl delete rke2-agent-1

# vim: set noexpandtab:
