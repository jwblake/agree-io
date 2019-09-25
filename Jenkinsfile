pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                sh 'bundle install --verbose'
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