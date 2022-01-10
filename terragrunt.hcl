inputs = {
  project_id = "pdemo-2022"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
  terraform {
    required_providers {
      google = {
        source  = "hashicorp/google"
        version = "~> 3.79"
      }
    }
  }
  EOF
}

remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "pdemo-2022-terraform"
    prefix   = "terraform/${path_relative_to_include()}"
    project  = "pdemo-2022"
    location = "US"
  }
}
