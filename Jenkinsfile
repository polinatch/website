pipeline {
    agent any
    stages {
	stage('Deploy') {
		steps {
			echo "Deploy"
			sh "ls -ltr /var/lib/jenkins/workspace/website/index.html"
			sh "cp -n /var/lib/jenkins/workspace/website/index.html /var/www/html/"
			sh "ps -ef|grep httpd"
			sh "sudo systemctl start httpd"
			sh "ps -ef|grep httpd"

		}
	}
	stage('Test') {
                steps {
                        echo "Test"
                }
        }
     }
}
