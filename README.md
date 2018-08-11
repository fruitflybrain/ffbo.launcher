# FFBO Compose
## FFBO Architecture

This repository consists of a set of tools that can be used to automate installation and execution of FFBO Architecture components. Components supported under this framework are:
* Processor - Coordinates other FFBO components, aggregates and processes their outputs, and runs a web interface
* NeuroArch Database - Stores neurophysiological data, is queried by Processor
* Natural Language Processing (NLP) Component - Processes natural language queries make through Processor to structured queries that can be used on NeuroArch Database

## Docker Compose

Docker Compose is a tool that simplifies the setup and operation of multi-container applications. Users enter their desired configuration, consisting of services (i.e. web servers, databaseses), networks, and volumes (shared directories between hosts and containers and between containers). On the command line, Docker Compose reads this configuration from a docker-compose.yml file and automatically sets up and manages the specified images, containers, networks, and volumes.

## Installation

This repository utilizes prebuilt images from Docker Hub. Before running the application, you should pull the required images for each service. This can be done for all services with
    
    docker-compose pull
    
and for specific services using
    
    docker-compose pull [SERVICE]
    
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
