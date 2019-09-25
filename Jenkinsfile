pipeline {
    agent any

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