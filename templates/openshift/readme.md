# Instructions
There are two templates in this directory:

- rhel7-fluentd-from-image
 - This will create a deployment config that deploys the container from dockerhub. 

```
oc create -f https://raw.githubusercontent.com/ArctiqTeam/rhel7-fluentd/master/templates/openshift/rhel7-fluentd-from-image.yaml
```

- rhel7-fluentd-from-source
 - This will create the artifacts to build from the dockerfile hosted on github. This
   is the recommended deployment method. 

```
oc create -f https://raw.githubusercontent.com/ArctiqTeam/rhel7-fluentd/master/templates/openshift/rhel7-fluentd-from-source.yaml
```
