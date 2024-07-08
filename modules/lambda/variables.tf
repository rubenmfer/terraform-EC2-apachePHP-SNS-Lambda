variable "filename" {
    type        = string
    description = "Filename"
}

variable "function_name" {
    type        = string
    description = "Function Name"
}

variable "role" {
    type        = string
    description = "IAM Role"
}

variable "runtime" {
    type        = string
    description = "Lambda language"
}

variable "sns_topic_arn" {
    type        = string
    description = "SNS topic ARN"
}

variable "slack_url" {
    type        = string
    description = "URL SLACK.COM"
}

variable "slack_channel" {
    type        = string
    description = "Channel slack"
}