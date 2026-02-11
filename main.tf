resource "aws_key_pair" "ssh_key" {
  key_name   = "ec2"
  public_key = var.public_key
}

resource "aws_instance" "server" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "spacelift-server"
  }
}
