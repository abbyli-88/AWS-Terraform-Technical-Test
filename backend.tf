terraform {
  backend "remote" {
    organization = "code-test"

    workspaces {
      name = "code_test_workspace"
    }
  }
}