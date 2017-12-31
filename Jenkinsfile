node {
    stage 'build'
   // sh "oc start-build bc/rhel7-fluentd-bc"
    openshiftBuild apiURL: 'https://172.30.0.1:443', authToken: '', bldCfg: 'bc/rhel7-fluentd-bc', buildName: '', checkForTriggeredDeployments: 'false', commitID: '', namespace: '', showBuildLogs: 'true', verbose: 'false', waitTime: '', waitUnit: 'sec'
    stage 'deploy'
   // sh "oc rollout latest dc/rhel7-fluentd"
    //openshiftDeploy(deploymentConfig: 'dc/rhel7-fluentd')

}