output "vpc_id" {
  value = aws_vpc.this.id
}
output "public_subnet_ids" {
  value = values(aws_subnet.public)[*].id
}
output "private_subnet_ids" {
  value = values(aws_subnet.private)[*].id
}
output "workload_security_group_id" {
  value = aws_security_group.workload.id
}
output "workload_role_arn" {
  value = aws_iam_role.workload.arn
}
output "flow_log_group_name" {
  value = aws_cloudwatch_log_group.vpc_flow_logs.name
}
