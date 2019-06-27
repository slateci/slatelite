# SLATElite
This project provides a lightweight "kubernetes-in-docker" cluster federated with [SLATE](http://slateci.io/).

## Minimum Requirements
- Linux (2 cores, 4GB memory, 15GB storage) or MacOS
- A publicly accessible IP address (port 6443 open)
- Python (3 or 2.7, 'python' must be in your PATH)
- [DockerCE](https://docs.docker.com/install/#supported-platforms)
- [Docker-Compose](https://github.com/docker/compose/releases) (installed with Docker for Mac)

On Linux, the user running SLATElite must be a member of the Docker group (or root).
Users can be added to the Docker group with: `sudo usermod -a -G docker <username>`

## Getting Started
After installing the dependency requirements and pulling the SLATElite repository:

Make sure your Docker is running.

Build the container images with	`./slatelite build` 
This will take a few minutes. Running this again is only required to pull updates to software.

Initialize the environment with `./slatelite init`

__TIP:__ Access local directories by mapping them into the SLATE container: `./slatelite init -v ~/WorkDir:/mnt`

[Utilize SLATE](http://slateci.io/docs/quickstart/slate-client.html#basic-use) with `./slatelite slate ...(cluster list, group list, etc)...`

Or shell into the container and run it "natively":
```
$ ./slatelite shell slate
# slate ...(cluster list, group list, etc)...
```

To **completely destroy** the environment such that it can be created again run: `./slatelite destroy`

For a more detailed description of each SLATElite command view [COMMANDS.md](https://github.com/slateci/slatelite/blob/master/COMMANDS.md)

## Deploying with CVMFS
If you need CVMFS for your environment you must supply your desired SLATE cluster name, a SLATE group that you are a member of, a valid SLATE access token, and the API endpoint you wish to connect to. 

You can setup a group at https://portal.slateci.io/groups

To get your access token go to https://portal.slateci.io/cli (Note: this token is for the prod API endpoint by default)

When choosing a cluster name be sure the name doesn't already belong to another cluster. You can do this through the SLATE Client (Download: https://portal.slateci.io/cli).

`./slatelite init --cluster <DESIRED CLUSTER NAME> --token <YOUR ACCESS TOKEN> --group <YOUR SLATE GROUP> --api <Either dev or prod>`

Example:

`./slatelite init --cluster my-cluster --group my-group --token 6mG2gTvDhgMWitF_bAy7aP --api dev`

You can manually specify an API endpoint address as well (Not reccomended).

`--api https://api-dev.slateci.io:18080`

## Internal Details
SLATElite is a docker-compose orchestrated standard SLATE deployment (with a couple performance tweaks for personal machines).

SLATElite spins up 3 containers with docker-compose. These include:
- [A docker-in-docker Kubernetes node](https://github.com/slateci/slatelite/blob/master/kube/Dockerfile)
- [A SLATE management container](https://github.com/slateci/slatelite/blob/master/slate/Dockerfile)
- [A storage container simulating an NFS share](https://hub.docker.com/r/itsthenetwork/nfs-server-alpine)

## Known issues

If you have a kubernetes cluster running directly on the host you wish to run Slatelite, this is known to cause odd interactions. (i.e. Kubelet/Kubadm/Kubectl is installed on the machine)