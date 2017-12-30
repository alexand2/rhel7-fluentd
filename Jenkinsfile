node('maven') {
stage 'build'
       openshiftBuild(buildConfig: 'rhel7-fluentd-bc', showBuildLogs: 'true')
       stage 'deploy'
       openshiftDeploy(deploymentConfig: 'rhel7-fluentd')
}