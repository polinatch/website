#!/bin/bash
yum -y install epel-release
echo "****Install GIT****"
sudo yum -y update
sudo yum -y install git
sudo git --version

echo "****Verify Java version****"
JAVA_VER=$(java -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*"/\1\2/p;')
if [[ "$JAVA_VER" -le 17 ]] 
then
	sudo yum -y install java-1.8.0-openjdk-devel
fi

echo "****Install jenkins****"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y install jenkins
sudo systemctl start jenkins
systemctl status jenkins
sudo systemctl enable jenkins

echo "****Install apache****"
sudo yum update httpd
sudo yum -y install httpd 
sudo tee /var/www/html/index.html > /dev/null <<EOT
<!DOCTYPE html>
<html>
<head>
    <titile>Hello world!</title>
</head>
<body>
    <h1>Hello World!</h1>
    <h2>Default page</h2>
</body>
</html>
EOT
sudo systemctl start httpd
sudo systemctl status httpd

echo "***End of the script****"


