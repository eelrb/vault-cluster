provider "aws" {}

data "aws_ami" "my_image" {
	
	most_recent=true

	filter {
	    name   = "name"
	    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
	  }

	  filter {
	    name   = "virtualization-type"
	    values = ["hvm"]
	  }

	  owners = ["099720109477"] # Canonical

}

resource "aws_instance" "blee-vault" {
  ami           = "${data.aws_ami.my_image.id}"
  instance_type = "t2.micro"
  #vpc_security_group_ids = ["${aws_security_group.main_sec_group.id}"]
  #subnet_id = "${aws_subnet.subnet1.id}"
  key_name = "blee-keypair"
  tags {
    #Name = "${var.instance_name_vault}"

  }
}
