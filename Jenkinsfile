pipeline {
    agent any
    stages {
	stage('Deploy') {
		steps {
			echo "Deploy"
			sh "ls -ltr /var/lib/jenkins/workspace/website/index.html"
			sh " echo y | cp /var/lib/jenkins/workspace/website/index.html /var/www/html/index.html"
			sh "ls -ltr /var/www/html/"
			sh "sudo systemctl restart httpd"

		}
	}
	stage('Test') {
                steps {
                        echo "Test"
                	try {
			    // Fails with non-zero exit if dir1 does not exist
    				def out = sh(script:'curl localhost |grep Hello', returnStdout:true).trim()
			} catch (Exception ex) {
    			println("Error in output")
}
}
        }
     }
}
