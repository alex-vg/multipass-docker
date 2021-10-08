# multipass-docker for windows
## setup and requirements
* install multipass
* install docker-compose (without docekr) if not already on host system (pip install docker-compose)
* start init-instance.bat
* configure on host system with env DOCKER_HOST set to tcp://{ubuntu-vm-ip}:2376
  * ubuntu-vm-ip can be retrieved by multipass list
