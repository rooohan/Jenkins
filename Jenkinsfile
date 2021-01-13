pipeline {
  agent any
  stages {
    stage('step1') {
      steps {
        echo 'start'
        sh 'MATLAB'
        runMATLABCommand "disp('Hello World!')"
      }
    }

  }
  environment {
    PATH = 'G:\\Import\\Anaconda3;G:\\Import\\Anaconda3\\Library\\mingw-w64\\bin;G:\\Import\\Anaconda3\\Library\\usr\\bin;G:\\Import\\Anaconda3\\Library\\bin;G:\\Import\\Anaconda3\\Scripts;%MAVEN_HOME%\\bin;%JAVA_HOME%\\bin;%JAVA_HOME%\\jre\\bin;C:\\Program Files (x86)\\Common Files\\Oracle\\Java\\javapath;%SystemRoot%\\system32;%SystemRoot%;%SystemRoot%\\System32\\Wbem;%SYSTEMROOT%\\System32\\WindowsPowerShell\\v1.0\\;%SYSTEMROOT%\\System32\\OpenSSH\\;C:\\Program Files\\TortoiseSVN\\bin;C:\\Program Files\\dotnet\\;G:\\APP\\nodejs\\;G:\\APP\\Matlab\\runtime\\win64;G:\\APP\\Matlab\\bin;G:\\APP\\Matlab\\polyspace\\bin;C:\\Program Files\\Docker\\Docker\\resources\\bin;C:\\ProgramData\\DockerDesktop\\version-bin;G:\\Import\\Git\\cmd;G:\\Import\\Git\\bin;G:\\Import\\Git\\usr\\bin;'
    nohup = 'G:\\Import\\Git\\usr\\bin'
    SHELL = 'G:\\Import\\Git\\bin\\sh.exe'
  }
}