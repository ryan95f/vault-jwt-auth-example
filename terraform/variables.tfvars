address = "localhost:8200"

environments = {
  "production" : {
    user_claim  = "branch",
    policy_path = "./policies/production.hcl"
    bound_claims = {
      branch = "main"
    }
  },
  "development" : {
    user_claim  = "branch"
    policy_path = "./policies/development.hcl"
    bound_claims = {
      branch = "dev"
    }
  }
}

secrets = {
  "production" : {
    message = "My Production Secret"
  },
  "development" : {
    message = "My Development Secret"
  }
}