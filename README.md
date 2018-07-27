# FFBO Architecture

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

To configure components, edit the './config.ini' file found in the main directory of this repository.

__SHOULD WE HAVE A CONFIGURATION GUIDE HERE?__
