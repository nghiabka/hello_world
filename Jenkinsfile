node {
  def dockerImage

  stage('Checkout') {
    echo 'Checking out code from local directory' // Or `checkout scm` if using Git
  }

  stage('Test') {
    try {
      sh 'pip3 install -r requirements.txt && pytest'
    } catch (e) {
      currentBuild.result = 'FAILURE'
      throw e
    }
  }

  stage('Build') {
    dockerImage = docker.build("python-app:${env.BUILD_NUMBER}")
  }

  stage('Deploy') {
    sh "docker rm -f python-app-container || true"
    dockerImage.run('-p 5000:5000 --name python-app-container')
  }

  stage('Smoke Test') {
    sleep 5
    def response = sh(script: "curl -s http://localhost:5000", returnStdout: true).trim()
    if (response == 'Hello, CI/CD World!') {
      echo "Smoke test passed!"
    } else {
      error "Smoke test failed: Expected 'Hello, CI/CD World!', got '${response}'"
    }
  }
}