output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = [for s in aws_subnet.public : s.id]
  description = "List of public subnet IDs"
}

output "instance_public_ip" {
  value       = aws_instance.app.public_ip
  description = "Public IP of the EC2 instance"
}

output "cloudwatch_log_group" {
  value       = aws_cloudwatch_log_group.flow.name
  description = "Name of the CloudWatch log group for VPC Flow Logs"
}

output "flow_log_id" {
  value       = aws_flow_log.vpc_flow.id
  description = "ID of the VPC Flow Log"
}


