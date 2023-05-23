variable "service_account" {
  type        = string
  sensitive   = true
  description = "The service account that will need access to the key. In the case of compute instances, it will look like {numbers}-compute@developer.gserviceaccount.com"
}

variable "secret_key" {
  type        = string
  sensitive   = true
  description = "The key for the secret."
}

variable "secret_value" {
  type        = string
  sensitive   = true
  description = "The value for the secret."
}
