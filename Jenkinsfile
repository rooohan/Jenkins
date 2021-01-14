pipeline {
  agent any
  stages {
    stage('step1') {
      steps {
        echo 'start'
        runMATLABCommand 'disp(\'Hello World!\')'
        runMATLABCommand 'matlab -nosplash -nodesktop -noFigureWindows -r SlkCodeGen'
      }
    }

  }
  environment {
    nohup = 'G:\\Import\\Git\\usr\\bin'
    SHELL = 'G:\\Import\\Git\\bin\\sh.exe'
  }
}