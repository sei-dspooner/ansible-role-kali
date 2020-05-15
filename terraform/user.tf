# Create the test user
module "user" {
  source = "github.com/cisagov/molecule-iam-user-tf-module?ref=bugfix%2Fadd-tags-for-role-assumption"

  providers = {
    aws                                    = aws.users
    aws.images-production-provisionaccount = aws.images_production_provisionaccount
    aws.images-staging-provisionaccount    = aws.images_staging_provisionaccount
    aws.images-production-ssm              = aws.images_production_ssm
    aws.images-staging-ssm                 = aws.images_staging_ssm
  }

  entity         = "ansible-role-kali"
  ssm_parameters = ["/gitlab/personal_authorization_token"]

  tags = var.tags
}
