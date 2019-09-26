pipeline {
    agent none
    environment {
        registry = '554386539706.dkr.ecr.us-east-1.amazonaws.com/ruby-2.1:latest'
    }
    stages {
        stage("ECR Login") {
            steps {
                withAWS(credentials:'aws-credential') {
                    script {
                        def login = ecrLogin()
                        sh "${login}"
                    }
                }
            }
        }
        stage('Install Gems') {
            agent { 
                docker { 
                    alwaysPull true
                    image '554386539706.dkr.ecr.us-east-1.amazonaws.com/ruby-2.1:latest' 
                    args '-u root:root'
                }
            }
            steps {
                script {
                    sh 'whoami'
                    sh 'pwd'
                    sh 'bundle install'
                }
            }
        }
        stage('Test') {
            steps {
                echo "Testing"
                sh "rake test RAILS_ENV=development"
            }
        }
        stage('Sonar Scan') {
            steps {
                echo "Scanning"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}