pipeline {
    agent { 
        dockerContainer {
            image 'my-python-venv:latest'
        }
    }

    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t my-python-venv .'
            }
        }

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/nghiabka/hello_world.git'
            }
        }

        stage('Setup Environment') {
            steps {
                sh '''
                    python3 -m venv venv
                    source venv/bin/activate
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    source venv/bin/activate
                    // python -m unittest discover -s . -p "test_*.py"
                '''
            }
        }

        stage('Run Application') {
            steps {
                sh '''
                    source venv/bin/activate
                    python hello.py
                '''
            }
        }
    }
}
