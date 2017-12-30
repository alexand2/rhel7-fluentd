node {
    stage 'build'

    openshiftBuild apiURL: '', authToken: '', bldCfg: 'rhel7-fluentd-bc', buildName: '', checkForTriggeredDeployments: 'false', commitID: '', namespace: '', showBuildLogs: 'true', verbose: 'false', waitTime: '', waitUnit: 'sec'

    stage 'deploy'

    openshiftDeploy(deploymentConfig: 'rhel7-fluentd')

}