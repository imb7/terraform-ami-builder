module "web-ec2-image-builder" {
  source  = "aws-ia/ec2-image-builder/aws"
  version = "~> 0.0.2"

  name                  = "web-ec2-image"

  vpc_id                = "<ENTER_VPC_ID>"
  subnet_id             = "<ENTER_SUBNET_ID>"

  aws_region            = "<ENTER_AWS_REGION>"

  source_cidr           = ["<ENTER your IP here to access EC2 Image Builder Instances through RDP or SSH>"]
  create_security_group = true
  create_key_pair       = true

  instance_types        = var.instance_types
  source_ami_name       = data.aws_ami.aws_base_image.name

  ami_name              = var.ami_name
  ami_description       = var.ami_description

  recipe_version        = "0.0.1"
  
  build_component_arn   = ["<ENTER_LIST_OF_BUILD_ARNS>"] # e.g.:  arn:aws:imagebuilder:ap-southeast-2:XXXXXXXXXXX:component/win2022build/0.0.1/1
  test_component_arn    = ["<ENTER_LIST_OF_TEST_ARNS>"]  # e.g.: arn:aws:imagebuilder:ap-southeast-2:XXXXXXXXXXXX:component/win2022test/0.0.1/1

  s3_bucket_name        = "<ENTER_S3_BUCKET_NAME>"
  custom_policy_arn     = "<ENTER_CUSTOM_POLICY_ARN>"
  platform              = "<Windows or Linux>"
  tags                  = "<ENTER_A_MAP_OF_RESOURCE_TAGS_TO_ASSOCIATE_WITH_THE_RESOURCES>"

  managed_components = "<ENTER_LIST OF AWS MANAGED COMPONENTS>"
  # e.g.:
  #managed_components = [{
  #  name    = "powershell-windows",
  #  version = "7.2.10"
  #  },
  #  {
  #    name    = "chocolatey",
  #    version = "1.0.0"
  #}]

  target_account_ids = [
    "<ENTER TARGET AWS ACCOUNT IDS.>"
  ]

  ami_regions_kms_key = {
    "<ENTER AWS REGIONS TO SHARE THE AMI WITH>" = "<ENTER KMS KEYs TO ENCRYPT AMIs ON THE TARGET REGION>",
    "us-west-2"                                 = "arn:aws:kms:us-west-2:XXXXXXX:key/mrk-XXXXXX",
    "us-east-1"                                 = "arn:aws:kms:us-east-1:XXXXXX:key/mrk-XXXX",
  }

}