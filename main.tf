resource "aws_instance" "name" {
  ami = "ami-0edc0a81903bf24ef"
  instance_type = "t3.micro"
  key_name = "demo1"
  tags = {
    Name= "automated-1"
  }
}

