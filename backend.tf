terraform {
  backend "remote" {
    organization = "example-org-819856"

    workspaces {
      name = "code_test"
    }
  }
}