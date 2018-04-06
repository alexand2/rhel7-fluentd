# Fluentd RHEL 7 Container
This image is based on RHEL7 and is intended to operate as 
a standalone container for aggregating logs from multiple 
fluentd containers. 

## Environment 
This image can be deployed in multiple environments, but 
the original intention is to be used in OpenShift. 

## Plugins
The following plugins are installed: 
- elasicsearch 
- secure forward
- remote_syslog -- https://github.com/dlackty/fluent-plugin-remote_syslog
- grep
- route

## ConfigMaps
The basic configuration in this container should be modified. 
In OpenShift, ConfigMaps should be used. 

## OpenShift Templates
The templates directory has OCP files that can be used with a docker build strategy or to deploy from dockerhub. 

## Todo
