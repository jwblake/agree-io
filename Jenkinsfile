pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Installing Pre-Requisites"
                sh 'yum install postgresql-devel'
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