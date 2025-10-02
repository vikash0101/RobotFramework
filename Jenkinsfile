pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dir('my_project_clone'){
                    echo "The selected cli value is: ${params.cli}"
                    git(url: 'https://github.com/vikash0101/RobotFramework.git/', 
                    branch: 'main',
                    credentialsId: 'myToken')
                    echo "Git project clone is success"
                    def currentDir = pwd()
                    echo "Current directory: ${currentDir}"
                    ls -la
                    echo 'listed'
                    // mkdir -p my_new_directory
                    // echo 'my_new_directory created'
                    // def currentDir = pwd()
                    // echo "Current directory: ${currentDir}"
                    }
                }
            }
        }
    }
}