variable "tf_state_bucket" {
  description = "The name of the S3 bucket to store the Terraform state file."
  type        = string
  default     = "devops-recipe-app-tf-state-rmauricio"
}

variable "tf_state_lock_table" {
  description = "The name of the DynamoDB table to use for state locking."
  type        = string
  default     = "devops-recipe-app-api-tf-lock"
}

variable "project" {
  description = "The name of the project."
  type        = string
  default     = "devops-recipe-app-api"
}

variable "contact" {
  description = "The contact information for the project."
  type        = string
  default     = "robert@example.com"
}
