module "terraform" {
  source = "./terraform"
  # todo : how to pass the variables to the module
  # AWS_ACCESS_KEY_ID     = ${{secrets.AWS_ACCESS_KEY_ID }}
  # AWS_SECRET_ACCESS_KEY = ${{secrets.AWS_SECRET_ACCESS_KEY }}
}