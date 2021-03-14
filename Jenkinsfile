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
				sleep(15)
				timeout(time: 1, unit: 'MINUTES') {
					waitForQualityGate abortPipeline: true				                           
				}
			}
		}
		stage ('Deploy Backend') {
			steps {
				sleep(10)
				deploy adapters: [tomcat9(credentialsId: 'TomcatLogin', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks-backend', war: 'target/tasks-backend.war' 
			}
		}
		stage ('API Test') {
			steps {
				dir('api-test') {
	           		git 'https://github.com/wregin/tasks-api-test'
	           		sh 'mvn test'
           		}
			}                
		}
		stage ('Deploy Frontend') {
			steps {
				dir('frontend') {
					git 'https://github.com/wregin/tasks-frontend'
					sh 'mvn clean package'
					deploy adapters: [tomcat9(credentialsId: 'TomcatLogin', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks', war: 'target/tasks.war' 
				}
			}
		}
		stage ('Functional Test') {
			steps {
				dir('functional-test') {
	           		git 'https://github.com/wregin/tasks-functional-tests'
	           		sh 'mvn test'
           		}
			}                
		}
		stage('Deploy Prod') {
			steps {
				sh 'docker-compose build'
				sh 'docker-compose up -d'
			}
		}
		stage ('Health Check') {
			steps {
				sleep(15)
				dir('functional-test') {
	           		sh 'mvn verify -Dskip.surefire.tests'
           		}
			}                
		}
	}
	post {
		always {
			junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml, api-test/target/surefire-reports/*.xml, functional-test/target/failsafe-reports/*.xml, functional-test/target/surefire-reports/*.xml'
			archiveArtifacts artifacts: 'target/tasks-backend.war, frontend/target/tasks.war', onlyIfSuccessful: true
		}
	}
}
