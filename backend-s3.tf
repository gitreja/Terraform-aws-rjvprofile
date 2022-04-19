terraform {
  backend "s3" {
    bucket = "rjteravprofile-state"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}