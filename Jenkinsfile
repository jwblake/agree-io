pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                sh 'echo Building'
                //sh 'rvm install "ruby-2.1.0"'
                //sh 'bundle install --verbose'
            }
        }
        stage('Test') {
            steps {
                //sh "rake test RAILS_ENV=development"
            }
        }
        stage('Deploy') {
            steps {
                //echo 'Deploying....'
            }
        }
    }
}