terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "jake-morgan"

    workspaces {
      name = "jenkins-jakemorgan-io"
    }
  }
}
