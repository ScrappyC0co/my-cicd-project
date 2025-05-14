terraform {
  backend "local" {
    path = "terraform.tfstate" # By default, Terraform stores its state locally (this file tells it to do that). Later, 
  }                            # we can use S3 remote backend to store state in AWS securely — but this is fine for development.
}
