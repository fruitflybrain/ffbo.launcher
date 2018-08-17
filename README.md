# FFBO Launcher

This repository consists of a set of tools that can be used to automate installation and launch components required by the two FFBO standalone tools:
* [NeuroNLP](https://neuronlp.fruitflybrain.org): a natural language portal for aggregated fruit fly data.
* [NeuroGFX](https://neurogfx.fruitflybrain.org): a graphical functional explorer for fruit fly brain circuit design and execution.

#### FFBO Architecture

The components in the backend of the FFBO architecture supported under this framework are:
* [Processor](https://github.com/fruitflybrain/ffbo.processor) - A central processor that routes messages between FFBO components and hosts web services.
* [NeuroArch Component](https://github.com/fruitflybrain/ffbo.neuroarch_component) - Component that hosts a NeuroArch Database where fly brain data are stored.
* [Natural Language Processing (NLP) Component](https://github.com/fruitflybrain/ffbo.nlp_component) - Component that processes natural language queries into structured queries that can be used on NeuroArch Database
* [Neurokernel Component](https://github.com/fruitflybrain/ffbo.neurokernel_component) - Component that executes fly brain circuit.

#### Docker Containerization and Launching

Each of the components is hosted in a [docker](https://docker.com) container. This repository uses
[Docker Compose](https://docs.docker.com/compose) as a tool to simplify the setup and maintenance of multi-container applications.
A config.ini file allows user to enter their desired configuration for the FFBO services (such as IP, port and password, etc).

## Requirements

- System Requirements
  - At least 8 GB of memory (16 or more recommended)
  - A CUDA enabled GPU, if NeuroGFX is needed.
  - OS: Linux (recommended) and Mac (only supports NeuroNLP)

- The following will need to be installed on your computer to run this software (see [Prerequisites Installation](#requirement_install) below if you don't have them installed) 
  - [Docker](https://docs.docker.com/install/)
  - [Docker Compose](https://docs.docker.com/compose/install/)
- Additional requirement to run NeuroGFX
  - [NVIDIA GPU Driver](https://www.nvidia.com/drivers)
  - [NVIDIA Container Runtime](https://github.com/NVIDIA/nvidia-container-runtime)


## Basic Usage

Assuming that you have the prerequisites installed, we cover here the basic usage for
the case when services run on a single machine with default configuration. 

#### Service Names
Here, the name of the services are
- ffbo.processor: service hosting Processor
- ffbo.neuroarch_component: service hosting NeuroArch component
- ffbo.nlp_component: service hosting NLP component
- ffbo.neurokernel_component: service hosting Neurokernel component

#### Installing Docker Images
This repository utilizes prebuilt images from Docker Hub. Before running the application,
you should pull the required images for each service. This can be done for all services with
    
    docker-compose pull
    
and for specific services using
    
    docker-compose pull [SERVICE...]
    
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
- NeuroNLP at: http://localhost:8081
- NeuroGFX at: http://localhost:8082

If you are not running services on your localhost, replace "localhost" with
the IP of the machine that you are running the (ffbo.processor) service.
For example, if you are running on an Amazon Web Service EC2 instance, 
replace "localhost" with the *public* IP of the instance.

#### Stopping Services

To stop all services:
     
    docker-compose stop
    
To stop specific services:
    
    docker-compose stop [SERVICE...]
    
Stopping services do not remove containers. 

#### Starting Stopped Services

To start stopped services or existing containers:
    
    docker-compose start [SERVICE...]
    
This command stops services but does not remove their containers.
This will be important if you wish to keep using the container
in which new information is added, such as tags in NeuroNLP.

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
    
    docker-compose log [SERVICE...]
    

## Advanced Usage
Please refer to our Wiki pages for more advance machine setup:
-  Local
   -  [Running All Services on a Single Machine](https://github.com/fruitflybrain/ffbo.launcher/wiki/Execution-on-a-Single-Local-Computer)
   -  [Running Services on Multiple Machines](https://github.com/fruitflybrain/ffbo.launcher/wiki/Execution-on-Multiple-Local-Computers)
-  Amazon Web Services (Using Amazon Machine Images)
   -  [Running All Services on a Single EC2 Instance]()
   -  [Running Services on Multiple EC2 Instances]()

## <a name="requirement_install"></a>Prerequisites Installation

This section provides documentation on installation and setup required software, and provide helpful links.

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

### NVIDIA Container Runtime Setup
- Ubuntu
  -  Script: `sh scripts/nvidia-setup-ubuntu.sh`
  -  [Guide](https://github.com/fruitflybrain/ffbo.launcher/wiki/NVIDIA-Runtime-Setup-for-Ubuntu)
- Mac ([NVIDIA Runtime](https://github.com/NVIDIA/nvidia-container-runtime) has no support for MacOS)
<!--- Windows ([NVIDIA Runtime](https://github.com/NVIDIA/nvidia-container-runtime) has no support for Windows)-->

