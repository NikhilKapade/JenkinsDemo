resource "aws_instance" "name" {
  ami = "ami-0edc0a81903bf24ef"
  instance_type = "c7i-flex.large"
  key_name = "demo1"
  tags = {
    Name= "jenkinEC2"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo yum install git -y",
      "sudo yum install java -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
      "sudo yum install jenkins -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "sudo yum install -y yum-utils",
      "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo",
      "sudo yum install terraform -y"
     ]
  }
}

