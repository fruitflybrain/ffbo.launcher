# FFBO Launcher

This repository consists of a set of tools that can be used to automate installation and launch components required by the two FFBO standalone services:
* [NeuroNLP](https://neuronlp.fruitflybrain.org): a natural language portal for aggregated fruit fly data.
* [NeuroGFX](https://neurogfx.fruitflybrain.org): a graphical functional explorer for fruit fly brain circuit design and execution.

__NOTE__ For specific notes, see the [wiki](https://github.com/fruitflybrain/ffbo.launcher/wiki)

## FFBO Architecture

The components in the backend of the FFBO architecture supported under this framework are:
* [Processor](https://github.com/fruitflybrain/ffbo.processor) - A central processor that routers messages between FFBO components and hosts web services.
* [NeuroArch Component](https://github.com/fruitflybrain/ffbo.neuroarch_component) - Component that hosts a NeuroArch Database where fly brain data are stored.
* [Natural Language Processing (NLP) Component](https://github.com/fruitflybrain/ffbo.nlp_component) - Component that processes natural language queries into structured queries that can be used on NeuroArch Database
* [Neurokernel Component](https://github.com/fruitflybrain/ffbo.neurokernel_component) - Component that executes fly brain circuit.

## Docker Containerization and Launching

Each of the components is hosted in a [docker](https://docker.com) container. This repository uses
[Docker Compose](https://docs.docker.com/compose) as a tool to simplify the setup and maintenance of multi-container applications.
A config.ini file allows user to enter their desired configuration for the FFBO services (such as IP, port and password, etc).

## Requirements

- System Requirements
  - At least 8 GB of memory
  - A CUDA enabled GPU, if NeuroGFX is needed.
  - OS: Linux (recommended), Mac and Windows (only supports NeuroNLP)

- The following packages will need to be installed on your computer to run this software
  - [Docker](https://docs.docker.com/install/)
  - [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

This repository utilizes prebuilt images from Docker Hub. Before running the application, you should pull the required images for each service. This can be done for all services with
    
    docker-compose pull
    
and for specific services using
    
    docker-compose pull [SERVICE]

## Setup

If you intend to run the ffbo.neurokernel_component service, you will need to install the nvidia-container-runtime, which interfaces between Docker and GPUs on the host machine, and set it as the default Docker runtime. This can be done on Debian-based linux systems using:

    sh setup_gpu.sh

For more information, see [https://github.com/nvidia/nvidia-container-runtime](https://github.com/nvidia/nvidia-container-runtime).

## Execution

__NOTE__ Execution of ffbo.compose requires the mounting of volumes, certain OSs require the user to specify which volumes can be mounted. If you have one of these OSs, please add this directory to the allowed volumes:
- __MAC OS X__ After you have started your local Docker Daemon, navigate to the Docker icon in the top right corner of the desktop. Click and navigate down to "Preference -> File Sharing". Click the "+" button. Navigate to and select this directory. Click "Apply & Restart". For reference, see https://www.youtube.com/watch?v=0j5RnprSBAk.

All services and networks can be initialized using
    
    docker-compose up
    
Specific services can be started using

    docker-compose up [SERVICE]
    
## Shutdown

The initial setup using 'docker-compose up' can be undone, and running containers stopped, using
    
    docker-compose down

This can be done for specific services using
    
    docker-compose down [SERVICE]

## Restart

Restarting a Docker container running a service can be done with
    
    docker-compose restart [SERVICE]
    
## Configuration

__NOTE__ When changing the port configuration, please make sure to change the exposed ports ("ports" under the relevant service) to match the configuration

To configure components, edit the ./config.ini file found in the main directory of this repository. Details on config file elements is provided through comments within the ./config.ini file
