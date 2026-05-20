terraform {
  cloud {
    organization = "SCPF-S56"
    workspaces {
      name = "management-repo"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = "SCPF-S56"
}

