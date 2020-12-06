pipeline {
    agent any
    stages {
	   stage('Deploy') {
		  steps {
        echo "Deploy"
        sh " sudo echo y | sudo cp /var/lib/jenkins/workspace/website/index.html /var/www/html/index.html"
        sh "sudo systemctl restart httpd"
      }
    }
    stage('Test') {
     steps {
        echo "Test"
       	script {
                try {
			    // Fails with non-zero exit if there is no Hello in output
                  def out = sh(script:'curl localhost |grep Hello', returnStdout:true).trim()
                  } catch (Exception ex) {
                    println("Error in output")
                  }
                  }
                }
              }
     }
}
