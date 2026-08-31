locals {
  name_prefix     = "${var.project_name}-${var.environment}"
  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets  = { for index, az in local.azs : az => cidrsubnet(var.vpc_cidr, 8, index) }
  private_subnets = { for index, az in local.azs : az => cidrsubnet(var.vpc_cidr, 8, index + 10) }
  common_tags     = { Project = var.project_name, Environment = var.environment, ManagedBy = "terraform" }
}
