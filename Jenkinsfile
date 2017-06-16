#!/usr/bin/env groovy

pipeline {
    agent { docker defaultWorker.getConfig("openstack-test") }
    options {
        ansiColor('xterm')
        timestamps()
        timeout(time: 2, unit: "HOURS")
    }
    stages {
        stage("systest") {
            steps {
                sh '''
                    # - initialize env vars
                    . systest/scripts/init_env.sh

                    # - record CI build info
                    systest/scripts/record_build_info.sh

                    # - setup ssh agent
                    eval $(ssh-agent -s)
                    ssh-add

                    # - run tests
                    make -C systest $JOB_BASE_NAME

                    # - record results
                    systest/scripts/record_results.sh
                '''
            }
        }
    }
    post {
        always {
            // cleanup workspace
            dir("${env.WORKSPACE}") { deleteDir() }
        }
    }
}
