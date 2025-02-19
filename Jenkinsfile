pipeline {
    agent {docker {
            image 'python:3.9'
        }
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/nghiabka/hello_world.git'
            }
        }

        stage('Setup Environment') {
            steps {
                sh 'python3 -m venv venv'
                // sh 'source venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'source venv/bin/activate && python -m unittest test_hello.py'
            }
        }

        stage('Run Application') {
            steps {
                sh 'source venv/bin/activate && python hello.py'
            }
        }
    }
}
