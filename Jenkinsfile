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
             		def stderrfile = 'stderr.out'
			try {
    				def output = sh(script:"curl localhost |grep Hello 2>${stderrfile}", returnStdout:true).trim()
			} catch (Exception ex) {
    			def errmsg = readFile(stderrfile)
    			println("Error in output")
			}
                }
        }
     }
}
