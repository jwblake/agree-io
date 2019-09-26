pipeline {
    agent any
    environment {
        registry = '554386539706.dkr.ecr.us-east-1.amazonaws.com'
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
                    image '${registry}/ruby-2.1:latest' 
                    args '-u root:root'
                }
            }
            steps {
                script {
                    sh 'bundle install'
                }
            }
        }
        stage('Test') {
            agent { 
                docker { 
                    image '${registry}/ruby-2.1:latest' 
                    args '-u root:root'
                }
            }
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