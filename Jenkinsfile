pipeline {
    agent { 
	docker{
		image 'instrumentisto/flutter'
		args '-u root --privileged'
	    }
	}
    stages {
	stage('flutter doctor') {
            steps {
                sh '''
		    flutter doctor -v
		'''
            }
        }
	stage('dependencies') {
            steps {
                sh '''
		    flutter pub get
		'''
            }
        }
	stage('test') {
            steps {
                sh '''
		    flutter test
		'''
            }
        }
        stage('Build') {
            steps {
                sh '''
                    flutter build apk 
		'''
            }
        }
	stage('Distribute Android APK') {
      	    steps {
          	appCenter apiToken: 'd404867f8a03d127d40d944e9e60328edb49a1a9',
                  ownerName: 'MALKIOT',
                  appName: 'medicalApp',
                  pathToApp: 'build/app/outputs/flutter-apk/app-release.apk',
                  distributionGroups: 'medicalApp-Distribution'
      	    }
	}
    stage('Firebase deploy') {
      	    steps {
                node('master'){
                    sh '''
                        firebase init hosting
                        firebase deploy --only hosting
                    '''
                }
      	    }
	}
    }
}
