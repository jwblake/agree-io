pipeline {
    parameters {
        string(name: 'Version', defaultValue: '1.0.0', description: 'Three-Digit Version Number')
        choice(name: 'Environment', description: 'Deploy Environment', choices: ['test'])
    }
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
        stage('K8 Deploy') {
            steps {
                withKubeConfig(credentialsId: 'kubeconfig-test', serverUrl: 'https://F988378660836019AB991E33A2BD817C.gr7.us-east-1.eks.amazonaws.com') {
                    echo "K8 Deploy..."
                    sh """
                        K8S_VARS='${params.VERSION}:${params.ENVIRONMENT}'
                        envsubst '$K8S_VARS' <deployment.yaml >deployment.yaml
                        kubectl apply -f kubernetes
                    """
                }
            }
        }
    }
}