pipeline {
    agent any
    stages {
        stage('Fetch git Project') {
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
                    // ls -la
                    // echo 'listed'
                    sh "mkdir -p my_new_directory"
                    // echo 'my_new_directory created'
                    // def currentDir = pwd()
                    // echo "Current directory: ${currentDir}"
                    }
                }
            }
        }
        stage('Copy Git Repo'){
            steps{
                echo 'create a new repo'
                sh "mkdir -p my_new_directory"
                echo 'created my_new_directory'
                script{
                    def currentDir = pwd()
                    echo "Current directory: ${currentDir}"                
                    sh "cp -Rp RobotFramework/* my_new_directory/"
                    sh "ls -la"
                    echo 'done'
                }
            }
        }
    }
}