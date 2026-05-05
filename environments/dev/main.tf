module "web-ec2-image-builder" {
  source = "../../modules/image-builder"

  #--- data block variables ---#
  ami_owner        = var.ami_owner
  ami_name_pattern = var.ami_name_pattern

  

}