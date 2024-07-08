# terraform-EC2-apachePHP-SNS
# añadir archivo ssh.pem -> ./modules/compute/userdata/
# añadir IAM ROLE SNSFULLACCESS a labrole y actualizar EC2
# crear tfvars.txt con las variables email = / slack_url = / slack_channel = 
# terraform apply -var-file=tfvars.txt