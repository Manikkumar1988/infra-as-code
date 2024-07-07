terraform {
  backend "s3" {
    bucket = "mk-iac-lab-4-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "mk-iac-lab-4-tfstate-locks"
    encrypt        = true
  }
}