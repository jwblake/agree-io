pipeline {
    agent { 
        docker { image 'ruby:2.1-wheezy' }
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