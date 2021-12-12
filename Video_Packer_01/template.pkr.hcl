// AWS Packer Builder

source "amazon-ebs" "packerami" {
	region = "eu-central-1"
	ami_name = "pkr-consul-v1.00{{timestamp}}"
	source_ami = "ami-0a49b025fffbbdac6"
	instance_type = "t2.micro"
	subnet_id = "subnet-08b6a7b8f4c1ea12e"
	ssh_username = "ubuntu"
	tags = {
		OS_Version = "Ubuntu Server 20.04 LTS (HVM), SSD Volume Type"
		Release = "Latest"
		Base_AMI_Name = "{{ .SourceAMIName }}"
		Name = "pkr-consul-img-v0.1"
	}
}

build {
	sources = ["source.amazon-ebs.packerami"]
	
	provisioner "file" {
		source = "server_agent.json"
		destination = "/home/ubuntu/server_agent.json"
	}

	provisioner "shell" {
		script = "./bootstrap.sh"
	}

}
