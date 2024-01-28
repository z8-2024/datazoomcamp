
variable "credentials" {
  description = "My Credentials"
  default = "~/.gc/ny-rides-z82024-tf-runner.json"
}

variable "project" {
  description = "Project Name"
  default = "ny-rides-z82024"
}

variable "region" {
  description = "Region"
  default = "asia-southeast1"
}

variable "location" {
  description = "Project Location"
  default = "asia-southeast1"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default = "demo_dataset"
}

variable "gcs_bucket_name" {
    description = "My Storage Bucket Name"
    default = "ny-rides-z82024-demo-bucket" 
}   

variable "gcs_storage_class" {
    description = "Bucket Storage Class"
    default = "REGIONAL"    
}



