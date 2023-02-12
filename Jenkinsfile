#!/usr/bin/env groovy
pipeline {
    agent {
        node any
    }
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhubcredentials')
    }

    stages {
        stage('Checkout') {
            steps {
                git(url: 'https://github.com/nishanttomar/predict-housing-prices.git', credentialsId: 'gitpattoken')
            }
        }

        stage('Build Image') {
            when {
                branch 'master'  //only run these steps on the master branch
            }
            
            // Jenkins Stage to Build the Docker Image
            steps{
                sh 'docker image build -t nishant88/knx-predict-price:$BUILD_NUMBER .'
            }

        }

        stage('Publish Image') {
            when {
                branch 'master'  //only run these steps on the master branch
            }

            // Jenkins Stage to Publish the Docker Image to Dockerhub or any Docker repository of your choice.
            steps{
                sh 'cat $DOCKERHUB_CREDENTIALS_PSW | docker login --username $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo 'Logged In....!' 
                sh 'docker push nishant88/knx-predict-price:$BUILD_NUMBER'
            }
        }
    }
}