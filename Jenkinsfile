pipeline {
    agent { 
        docker { image 'node:7-alpine' }
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
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}