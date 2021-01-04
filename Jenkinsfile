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
        sh 'python "new/test_file.py"'
      }
    }

  }
  post {
        always {
            junit 'build/reports/test_file/test_file1.xml'
        }
  }
  
}