resource "aws_lambda_function" "lambda_slack" {
    function_name    = var.function_name
    //filename         = var.filename
    filename         = data.archive_file.lambda_zip.output_path
    role             = var.role
    handler          = "lambda_function.lambda_handler"
    runtime          = var.runtime
    
    environment {
      variables = {
        slack_url = var.slack_url
        slack_channel = var.slack_channel
      }
    }

}

resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_slack.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = var.sns_topic_arn
}


data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/userdata/lambda_function.py"
  output_path = "${path.module}/userdata/lambda_function.zip"
}
