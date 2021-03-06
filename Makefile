all:

config:
	$(eval SERVER_IP := $(shell terraform output -json | jq -r .k3s_server_ip.value))
	@ssh -o StrictHostKeyChecking=no root@$(SERVER_IP) cat /etc/rancher/k3s/k3s.yaml 2>/dev/null | sed -e 's/127.0.0.1/$(SERVER_IP)/ig'
