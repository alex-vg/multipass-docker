multipass launch --name dockerhost focal --mem 2500M
rem as admin:  multipass set local.privileged-mounts=on
rem https://multipass.run/docs/set-command#local.privileged-mounts
multipass mount volumes dockerhost:/volumes
multipass transfer setup-instance.sh dockerhost:/home/ubuntu/setup-instance.sh
multipass transfer daemon.json dockerhost:/home/ubuntu/daemon.json
multipass transfer override.conf dockerhost:/home/ubuntu/override.conf
multipass exec dockerhost -- sh -x /home/ubuntu/setup-instance.sh
multipass list
rem set DOCKER_HOST=tcp://192.168.133.108:2376