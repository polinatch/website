pipeline {
    agent any
    stages {
	stage('Deploy') {
		steps {
			echo "Deploy"
			sh "cp -n /var/lib/jenkins/workspace/website/index.html /var/www/html/"
			sh "sudo systemctl start httpd"

		}
	}
	stage('Test') {
                steps {
                        echo "Test"
                }
        }
     }
}
