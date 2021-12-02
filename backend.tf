terraform {
  backend "remote" {
    organization = "code_test"

    workspaces {
      name = "code_test_workspace"
    }
  }
}