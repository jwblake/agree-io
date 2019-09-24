pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'bundle install'
            }
        }
        stage('Test') {
            steps {
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