pipeline {
	agent any
	stages {
		stage ('Build Backend') {
			steps {
				sh 'mvn clean package -DskipTests=true'
			}
		}
		stage ('Unit Tests') {
			steps {
				sh 'mvn test'
			}
		}
		stage ('Sonar Analysis') {
			environment {
			    scannerHome = tool 'SONAR_SCANNER'
			}
			steps {
				withSonarQubeEnv('SONAR_LOCAL') {
					sh "${scannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=DeployBack -Dsonar.host.url=http://localhost:9000 -Dsonar.login=3fb9a4a29e1e683b62d3561422857ae583f99e1d -Dsonar.java.binaries=target"
				}	
			}
		}
		stage ('Quality Gate') {
			steps {
				sleep(30)
				timeout(time: 1, unit: 'MINUTES') {
					waitForQualityGate abortPipeline: true				                           
				}
			}
		}
	}
}

// removido do sonar local  -Dsonar.coverage.exclusions=**/.mvn/**, **/src/test/**,**/model/**,**/Application.java
