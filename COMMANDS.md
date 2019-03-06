
## SLATElite Commands
A listing of all SLATElite subcommands and their arguments.

### Build
Build/rebuild container images
```
$ ./slatelite build [container_name]
```
_Optional Argument_:

__container_name__ [slate or kube] - builds a single container image as opposed to all

### Init
Initialize slatelite containers
```
$ ./slatelite init [-v hostDir or hostDir:containerDir] [-p hostPort or hostPort:containerPort]
```
_Optional Arguments_:

__volume__ [-v, --volume] - Create a Docker volume of a host directory to a directory in the SLATE container (e.g. `-v ~/WorkDir:/mnt`)

If a directory in the container is not specified (e.g. `-v ~/WorkDir`) volumes will be mounted by their directory name under /mnt (e.g. /mnt/WorkDir).

__publish__ [-p, --publish, --port] - Publish a port in the Kubernetes container to the host (e.g. `-p 3000:80`)

If a single port is specified (e.g. `-p 3000`) that port will be mapped to the same port on the host.

### Status
View status of slatelite containers
```
$ ./slatelite status
      Name                     Command               State                                                                                        Ports                                                                                     
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
slatelite_db_1      java -jar DynamoDBLocal.jar      Up      8000/tcp                                                                                                                                                                       
slatelite_kube_1    /bin/bash -c exec /sbin/in ...   Up      0.0.0.0:30000->30000/tcp, 0.0.0.0:30001->30001/tcp, 0.0.0.0:30002->30002/tcp ... 0.0.0.0:30100->30100/tcp, 0.0.0.0:6443->6443/tcp, 0.0.0.0:8080->80/tcp 
slatelite_nfs_1     /usr/bin/nfsd.sh                 Up                                                                                                                                                                                     
slatelite_slate_1   /usr/bin/slate-service           Up      0.0.0.0:18080->18080/tcp, 0.0.0.0:5000->5000/tcp, 0.0.0.0:5100->5100/tcp   
```
_No parameters_.

### Shell
Open a shell in a SLATElite container
```
user@host$ ./slatelite shell {container_name}
root@container_id# 
```
_Required Argument_:

__container_name__ [slate or kube] - the container to open a shell within

### Slate
Run a SLATE command
```
$ ./slatelite slate {slate_command}
```
_Required Argument_:

__slate_command__ - A valid SLATE command (e.g. `./slatelite slate vo list`)

### Destroy
Completely destroy the SLATElite environment
```
$ ./slatelite destroy [-y] [--rmi]
```
_Optional Arguments_:

__-y__ - Assume yes for prompt to confirm destroy

__-\-rmi__ - Also remove the built images (they will be rebuilt on next `./slatelite init` or manually with `./slatelite build`)

### Pause
Freezes the state of the SLATElite environment (helpful to free up host resources or change host state (sleep, reboots, etc.)
```
$ ./slatelite pause
```
_No Arguments_.

### Unpause
Unfreeze the SLATElite environment after pausing
```
$ ./slatelite unpause
```
_No Arguments_.

### Kubectl
Run a kubectl command from the host in the SLATElite environment
```
$ ./slatelite kubectl {kubectl_command}
```
_Required Argument_:

__kubectl_command__ - A valid kubectl command (e.g. `./slatelite kubectl get nodes`)

### Exec
Run any command from the host in a selected container
```
$ ./slatelite exec {container_name} {command}
```
_Required Arguments_:

__container_name__ [slate or kube] - the container to execute a command within

__command__ - A valid shell command (e.g. `uname -a`)
