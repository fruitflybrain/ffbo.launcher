# FFBO Launcher for [Hemibrain-v1.0](https://www.janelia.org/project-team/flyem/hemibrain)

This repository consists of a set of tools that can be used to automate installation and launch components required by the standalone tools of the [Fruit Fly Brain Observatory](http://fruitflybrain.org) (FFBO):
* [NeuroNLP](https://neuronlp.fruitflybrain.org): a natural language portal for aggregated fruit fly data.

#### FFBO Architecture

The components in the backend of the FFBO architecture supported under this framework are:
* [Processor](https://github.com/fruitflybrain/ffbo.processor) - A central processor that routes messages between FFBO components and hosts web services.
* [NeuroArch Component](https://github.com/fruitflybrain/ffbo.neuroarch_component) - A component that hosts a NeuroArch Database where fly brain data are stored.
* [Natural Language Processing (NLP) Component](https://github.com/fruitflybrain/ffbo.nlp_component) - A component that processes natural language queries into structured queries that can be used on NeuroArch Database

#### Docker Containerization and Launching

Each of the components is hosted in a [docker](https://docker.com) container. This repository uses
[Docker Compose](https://docs.docker.com/compose) as a tool to simplify the setup and maintenance of multi-container applications.
A config.ini file allows user to enter their desired configuration for the FFBO services (such as IP, port and password, etc).

## Requirements

- System Requirements
  - At least 16 GB of memory (32 GB or more recommended)
  - OS: Linux (recommended) and Mac
  - Disk: A high performance disk is required for stable function, NVMe SSD is recommended to host Docker images (to change the Docker folder on your machine, follow [this post](https://medium.com/developer-space/how-to-change-docker-data-folder-configuration-33d372669056), for example.

- The following will need to be installed on your computer to run this software (see [Prerequisites Installation](#requirement_install) below if you don't have them installed) 
  - [Docker](https://docs.docker.com/install/) (17.12.0-ce and up tested on Ubuntu 16.04 and MacOS 10.13)
  - [Docker Compose](https://docs.docker.com/compose/install/) (1.22.0 and up tested on Ubuntu 16.04 and MacOS 10.13)
- To launch applications on Amazon Web Services (AWS) EC2 instances:
  - An Amazon Machine Image is provided. Details can be found under this [guide](https://github.com/fruitflybrain/ffbo.launcher/wiki/Running-All-Services-on-a-Single-Amazon-Web-Service-EC2-Instance).

## Basic Usage

Assuming that you have the prerequisites installed, we cover here the basic usage for
the case when services run on a single machine with default configuration.
The typical install time is approximately the time for your computer to download 12 GB of docker images.

#### Cloning This Repository and Checkout `hemibrain` Branch

The first step to install FFBO is to clone this repository to the machine(s) where you will run FFBO.
We will utilize `docker-compose.yml` in this repository to automatically pull down all docker images from [Docker Hub](https://hub.docker.com/r/fruitflybrain/).

If you are using the provided Amazon Machine Image on AWS EC2, the repository has already been clone. Please pull the latest version and checkout the `hemibrain` branch in order to stay updated.

#### Service Names
Here, the name of the services are
- ffbo.processor: service hosting Processor
- ffbo.neuroarch_component: service hosting NeuroArch component
- ffbo.nlp_component: service hosting NLP component

#### Installing Docker Images
This repository utilizes prebuilt images from Docker Hub. Before running the application,
you should pull the required images for each service. This can be done for all services with
    
    docker-compose pull
    
and for specific services using
    
    docker-compose pull [SERVICE...]
    
The entire set of images is about 30 GB, so depending on your network speed,
it will take some time to download all of them.
Once they are done, you should find the following 3 docker images in your system.

![result of `docker-compose pull`](https://raw.githubusercontent.com/fruitflybrain/ffbo.launcher/images/images/pull.jpg "result of `docker-compose pull`")

You can also use this command to update to the latest docker images on Docker Hub.

#### Starting Services
__Note for MAC Users:__ If you have removed default Docker shared folders, you need to add this folder into Docker's file sharing directories in Docker Preferences. After you have started your local Docker Daemon, navigate to the Docker icon in the top right corner of the desktop. Click and navigate down to "Preference -> File Sharing". Click the "+" button. Navigate to and select this directory. Click "Apply & Restart". For reference, see https://www.youtube.com/watch?v=0j5RnprSBAk.

To start all services:
    
    docker-compose up
    
Specific services can be started using

    docker-compose up [SERVICE...]
    
To run services in the background and suppress outputs:
    
    docker-compose up -d
    
Once all services created, wait for 1 minute. Then, you can start using
- NeuroNLP at: http://localhost:8081 (You can expect the same website as https://neuronlp.fruitflybrain.org. A list of demos can be launched by Get Started -> Demos.)

If you are not running services on your localhost, replace "localhost" with
the IP of the machine that you are running the (ffbo.processor) service.
For example, if you are running on an Amazon Web Service EC2 instance, 
replace "localhost" with the *public* IP of the instance.

If the system is properly started, you should see "nlp", and "na" servers fully
populated with a number and name, similar to the following:

!["result of `docker-compose up`"](https://raw.githubusercontent.com/fruitflybrain/ffbo.launcher/images/images/up.jpg "result of `docker-compose up`")

If you encounter any problems launching or using the services, please check out
[Troubleshooting](https://github.com/fruitflybrain/ffbo.launcher/wiki/Troubleshooting).

#### Stopping Services

To stop all services:
     
    docker-compose stop
    
To stop specific services:
    
    docker-compose stop [SERVICE...]
    
This command stops services but does not remove their containers.
This will be important if you wish to keep using the container
in which new information is added, such as tags in NeuroNLP.

#### Starting Stopped Services

To start stopped services or existing containers:
    
    docker-compose start [SERVICE...]
    

#### Restarting Services

To restart running or stopped services:
    
    docker-compose restart [SERVICE...]

#### Removing Services

To stop and remove all services:
    
    docker-compose down
    
To stop and remove specific services:
    
    docker-compose down [SERVICE...]
    
This removes all containers. Anything stored in a service (such as tags in NeuroNLP)
will no longer accessed or recovered.

#### Displaying Log from Services
To display log output from services:
    
    docker-compose logs [SERVICE...]
    

## Advanced Usage
Please refer to our Wiki pages for more advance machine setup:
-  Local
   -  [Running All Services on a Single Machine](https://github.com/fruitflybrain/ffbo.launcher/wiki/Running-All-Services-on-a-Single-Machine)
   -  [Running Services on Multiple Machines](https://github.com/fruitflybrain/ffbo.launcher/wiki/Running-Services-on-Multiple-Machines)
-  Amazon Web Services (Using Amazon Machine Images)
   -  [Running All Services on a Single EC2 Instance](https://github.com/fruitflybrain/ffbo.launcher/wiki/Running-All-Services-on-a-Single-Amazon-Web-Service-EC2-Instance) (Please remember to pull the ffbo.launcher respository and switch to the `hemibrain` branch)
   -  [Running Services on Multiple EC2 Instances](https://github.com/fruitflybrain/ffbo.launcher/wiki/Running-Services-on-Multiple-EC2-Instances) (Please remember to pull the ffbo.launcher respository and switch to the `hemibrain` branch)

## <a name="requirement_install"></a>Prerequisites Installation

This section provides documentation on installation and setup for required software, and provides helpful links.

### Install Docker

- Ubuntu
  -  Script: `sh scripts/docker-install-ubuntu.sh`
  -  [Official Installation Documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
  -  [Video](https://www.youtube.com/watch?v=V9AKvZZCWLc)
- Mac
  -  Download [Installer](https://download.docker.com/mac/stable/Docker.dmg) or use provided script: `sh scripts/docker-install-mac.sh`
  -  [Official Installation Documentation](https://docs.docker.com/docker-for-mac/install/)
  -  [Video](https://www.youtube.com/watch?v=lNkVxDSRo7M)
<!---- Windows
  -  Script: `sh scripts/docker-install-win.sh`
  -  [Guide](https://docs.docker.com/docker-for-windows/install/)
  -  [Video](https://www.youtube.com/watch?v=S7NVloq0EBc)-->
  
### Install Docker Compose

- Ubuntu
  -  [Official Installation Documentation](https://docs.docker.com/compose/install/#install-compose)
- Mac
  -  Included in Docker installation.


## Licenses of Data in FFBO
Additional licenses and acknowledgements for data used in FFBO can be found [here](http://fruitflybrain.org/licenses.html).
