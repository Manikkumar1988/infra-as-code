terraform {
  backend "s3" {
    bucket = "mk-iac-lab-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "mk-iac-lab-tfstate-locks"
    encrypt        = true
  }
}