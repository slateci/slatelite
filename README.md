# SLATElite

This project is a trial distribution of the [SLATE project](http://slateci.io/) with a single Kubernetes node.

This project utilizes a 'docker-in-docker' architecture. The entire environment is enclosed in Docker containers, including Kubernetes.

The primary purpose of this project is to provide a trial deployment of a SLATE environment with minimal host dependencies or interference.

## Minimum Requirements

2 cores CPU and 4GB RAM recommended for minimum reasonable performance.

At least 10GB available disk is recommended. Kubernetes will take up a few GB alone.

## Install Dependencies

### Docker CE:

Docker CE on CentOS: https://docs.docker.com/install/linux/docker-ce/centos/

Docker CE on Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/

Other Linux operating systems are in the sidebar.

### Docker Compose:

Use [pip](https://github.com/pypa/pip). It can be installed with your package manager or [get-pip.py](https://bootstrap.pypa.io/get-pip.py)

Then run: `(sudo) pip install docker-compose`

### SLATE Docker Images:

Inside the project directory run: `./slatelite build`

This will take a minute or so. It is pulling container dependencies and the SLATE project.

## Usage

Run `./slatelite init` to spin up the containers for the MiniSLATE environment and install Kubernetes.

As SLATElite utilizes the live SLATE API server you will need to register your SLATElite cluster to use it.

Visit [the SLATE portal](https://portal.slateci.io/cli) to get your cli setup script, copy it to your clipboard,
then run `./slatelite shell slate` and paste in the script. Then type `exit` to return to your host shell.

When the process is complete you can issue commands from the slate client in a new terminal:

`./slatelite slate ...(cluster list, vo list, etc)...`

You can also just get a shell in the slate container with: `./slatelite shell slate`

To pause/suspend the environment run: `./slatelite pause`
Then turn it back on with: `./slatelite unpause`

To **completely destroy** the environment such that it can be created again run: `./slatelite destroy`

`./slatelite build` can be run again before re-initializing the environment with `./slatelite init`

`./slatelite build` will always pull the latest releases of the SLATE software.

Note that you upon destroying and re-initializing you'll need to run:

`./slatelite slate cluster delete {your_cluster_name}`

Then recreate it with:

`./slatelite slate cluster create {your_cluster_name} --vo {vo_name}`

This is required as the destroy/re-init process creates an entirely new Kubernetes installation.
