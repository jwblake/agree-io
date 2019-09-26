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
        stage('Ruby Build') {
            agent { 
                docker { 
                    alwaysPull true
                    image '${registry}/ruby-2.1-postgres:latest' 
                    args '-u root:root -e POSTGRESQL_USER=docker  -e POSTGRESQL_PASSWORD=docker -e POSTGRESQL_DATABASE=agree'
                }
            }
            stages {
                stage ("Bundle Install") {
                    steps {
                        script {
                            sh 'bundle install'
                        }
                    }
                }
                stage ("Test") {
                    steps {
                        script {
                            sh "/start_postgres.sh &"
                            try {
                                sh "rake test RAILS_ENV=development"
                            } catch (err) {
                                currentBuild.result = 'UNSTABLE'
                            }
                        }
                    }
                }
            }
        }
        stage('Deploy Docker') {
            steps {
                echo 'Deploying....'
                sh 'docker build -t agree-io:latest .'
                sh 'docker tag agree-io:latest ${registry}/agree-io:latest'
                sh 'docker push ${registry}/agree-io:latest'
            }
        }
    }
}