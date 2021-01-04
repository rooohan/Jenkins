pipeline {
  agent {
    docker {
      image 'python:3-alpine'
    }

  }
  stages {
    stage('step1') {
      steps {
        echo 'start'
        sh 'echo "Hello World !"'
      }
    }

    stage('env test') {
      steps {
        sh 'python --version'
      }
    }

    stage('pyfile test') {
      steps {
        sh 'ls'
      }
    }

  }
}