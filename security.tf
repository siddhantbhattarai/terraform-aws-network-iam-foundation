resource "aws_security_group" "workload" {
  name        = "${local.name_prefix}-workload"
  description = "Baseline private workload security group."
  vpc_id      = aws_vpc.this.id

  egress {
    description = "HTTPS to AWS APIs and package sources"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-workload-sg" })
}
