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
        sh 'python "new/test_file.py"'
      }
    }

  }
<<<<<<< HEAD

=======
  post {
    always {
      junit 'build/reports/test_file/test_file1.xml'
    }

  }
>>>>>>> 77626fbfb907f58146a4b7c1c5b3b4b4fec3c83d
}