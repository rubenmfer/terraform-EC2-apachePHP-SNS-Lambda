output "lambda_slack" {
  description = "The ARN of the Lambda Function"
  value       = aws_lambda_function.lambda_slack.arn
}