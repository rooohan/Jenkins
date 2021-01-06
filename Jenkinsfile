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
        sh 'pwd'
      }
    }

    stage('pyfile test') {
      steps {
        sh 'python new\\test_file.py'
      }
    }

  }

}