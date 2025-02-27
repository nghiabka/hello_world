node {
  def dockerImage

  stage('Checkout') {
    checkout scm // Fetches code from the configured Git repo
  }

  stage('Test') {
    try {
      sh 'python3 -m venv venv'
      sh '. venv/bin/activate && pip install -r requirements.txt && pytest'
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
    dockerImage.run('-p 5000:5000 --network host --name python-app-container')
  }

  stage('Smoke Test') {
    sleep 5
    echo "Running on host"
    // def response = sh(script: "curl -s http://localhost:5000", returnStdout: true).trim()
    // echo response
    // if (response == 'Hello, CI/CD World!') {
    //   echo "Smoke test passed!"
    // } else {
    //   error "Smoke test failed: Expected 'Hello, CI/CD World!', got '${response}'"
    // }
  }
}
