pipeline {
  agent any
  stages {
    stage('step1') {
      steps {
        echo 'start'
        sh 'pwd'
        runMATLABCommand 'disp(\'Hello World!\')'
        runMATLABCommand 'CodeGenerate'
      }
    }

  }
  environment {
    nohup = 'G:\\Import\\Git\\usr\\bin'
    SHELL = 'G:\\Import\\Git\\bin\\sh.exe'
    PATH = 'G:\\APP\\Matlab\\bin\\win64'
  }
}