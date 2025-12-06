output "alb_dns" {
  description = "Public ALB DNS name - use this to test the app"
  value       = aws_lb.alb.dns_name
}
