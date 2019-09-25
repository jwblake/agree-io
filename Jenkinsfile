pipeline {
    agent { 
        docker { image '554386539706.dkr.ecr.us-east-1.amazonaws.com/ruby-2.1:latest' }
    }

    stages {
        stage('Install Gems') {
            steps {
                sh 'bundle install'
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