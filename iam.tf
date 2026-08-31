resource "aws_iam_role" "flow_logs" {
  name               = "${local.name_prefix}-vpc-flow-logs"
  assume_role_policy = jsonencode({ Version = "2012-10-17", Statement = [{ Effect = "Allow", Principal = { Service = "vpc-flow-logs.amazonaws.com" }, Action = "sts:AssumeRole" }] })
}

resource "aws_iam_role_policy" "flow_logs" {
  name   = "write-vpc-flow-logs"
  role   = aws_iam_role.flow_logs.id
  policy = jsonencode({ Version = "2012-10-17", Statement = [{ Effect = "Allow", Action = ["logs:CreateLogStream", "logs:DescribeLogStreams", "logs:PutLogEvents"], Resource = "${aws_cloudwatch_log_group.vpc_flow_logs.arn}:*" }] })
}

resource "aws_iam_role" "workload" {
  name               = "${local.name_prefix}-workload"
  assume_role_policy = jsonencode({ Version = "2012-10-17", Statement = [{ Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" }, Action = "sts:AssumeRole" }] })
  tags               = local.common_tags
}

resource "aws_iam_role_policy" "workload_logs" {
  name   = "write-application-logs"
  role   = aws_iam_role.workload.id
  policy = jsonencode({ Version = "2012-10-17", Statement = [{ Effect = "Allow", Action = ["logs:CreateLogStream", "logs:PutLogEvents"], Resource = "*" }] })
}

resource "aws_iam_instance_profile" "workload" {
  name = "${local.name_prefix}-workload"
  role = aws_iam_role.workload.name
}
