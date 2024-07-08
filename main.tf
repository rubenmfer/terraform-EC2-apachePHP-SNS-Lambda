module "sns" {
    source          = "./modules/sns"
    sns_topic_name  = "formulario"
    email           = var.email
    lambda          = module.lambda.lambda_slack
}

module "lambda" {
    source          = "./modules/lambda"
    function_name   = "lambda-sns-slack"
    filename        = "slack"
    role            = "arn:aws:iam::169821150262:role/LabRole"
    runtime         = "python3.12"
    slack_url       = var.slack_url
    slack_channel   = var.slack_channel
    sns_topic_arn   = module.sns.sns_topic_arn
}


module "compute" {
    source          = "./modules/compute"
    ami             = "ami-01b799c439fd5516a"
    instance_type   = "t2.micro"
    key_name        = "vockey"
    ssh_user        = "ec2-user"
    ssh_fname       = "ssh.pem"
    script          = "install_apache.sh"
    sns_topic_arn   = module.sns.sns_topic_arn
}