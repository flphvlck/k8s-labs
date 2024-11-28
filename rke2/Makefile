help:
	@echo "Usage: make {create|start|stop|delete}"

create:
	limactl start --name=rke2-server-1 --tty=false rke2-server.yaml
	limactl start --name=rke2-agent-1 --tty=false rke2-agent.yaml

start:
	limactl start --name=rke2-server-1 --tty=false
	limactl start --name=rke2-agent-1 --tty=false

stop:
	limactl stop rke2-server-1
	limactl stop rke2-agent-1
    
delete:
	limactl stop -f rke2-server-1
	limactl stop -f rke2-agent-1
	limactl delete rke2-server-1
	limactl delete rke2-agent-1

# vim: set noexpandtab:
