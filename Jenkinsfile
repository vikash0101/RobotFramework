pipeline {
    agent any
    stages {
        stage('Fetch git Project') {
            steps {
                script {
                    def currentDir = pwd()
                    echo "Current directory is: ${currentDir}"
                }
                echo 'mkdir -p directory'
                //sh "mkdir -p my_new_directory"
                //sh 'echo "Current directory from shell: $(pwd)"'
                dir('directory'){
                    git branch: 'main', credentialsId: 'myToken', url: 'https://github.com/vikash0101/RobotFramework.git'
                    echo "Git project clone is success"
                    fileExists 'Config/conf.yaml'
                    //sh 'echo "Current directory from shell: $(pwd)"'
                    script {
                    def currentDir = pwd()
                    echo "Current directory is: ${currentDir}"
                }
                }
                //sh 'echo "Current directory from shell: $(pwd)"'
                // script {
                //     //sh "mkdir -p my_new_directory"
                //     dir('my_new_directory'){
                //     echo "The selected cli value is: ${params.cli}"
                //     git(url: 'https://github.com/vikash0101/RobotFramework.git/', 
                //     branch: 'main',
                //     credentialsId: 'myToken')
                //     echo "Git project clone is success"
                //     def currentDir = pwd()
                //     echo "Current directory: ${currentDir}"
                //     // ls -la
                //     // echo 'listed'
                //     //sh "mkdir -p my_new_directory"
                //     // echo 'my_new_directory created'
                //     // def currentDir = pwd()
                //     // echo "Current directory: ${currentDir}"
                //     }
                // }
            }
        }
        stage('Copy Git Repo'){
            steps{
                echo 'create a new repo'
                dir('my_new_directory'){
                    script{
                    def currentDir = pwd()
                    echo "Current directory is: ${currentDir}"
                    "cp -Rp directory/* my_new_directory/"
                    echo 'listing files'
                    "ls -la"
                    echo 'listed'
                    }
                }
            }
        }
        stage('InsideRobotFramework'){
            steps{
                dir('my_new_directory'){
                echo 'executing bat command'
                bat '''
                    dir /b
                    docker build -t myproject1:latest .
                    docker run myproject1:latest $cli
                    '''
                echo 'bat command executed'
                }
            }
        }
    }
}