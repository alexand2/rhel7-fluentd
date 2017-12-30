node {
    stage 'build'

   // openshiftBuild apiURL: '', authToken: '', bldCfg: 'rhel7-fluentd-bc', buildName: '', checkForTriggeredDeployments: 'false', commitID: '', namespace: '', showBuildLogs: 'true', verbose: 'false', waitTime: '', waitUnit: 'sec'
    stage 'deploy'
    sh "oc rollout latest dc/rhel7-fluentd"
    //openshiftDeploy(deploymentConfig: 'dc/rhel7-fluentd')

}