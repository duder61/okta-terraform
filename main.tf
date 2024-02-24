terraform {
  required_providers {
    okta = {
      source = "okta/okta"
    }
  }
}

provider "okta" {
  org_name = "dev-61877766"
  base_url = "okta.com"
  client_id   = "0oafb7z0umCDddkdb5d7"
  scopes = ["okta.groups.manage", "okta.groups.read","okta.users.manage"]
  private_key = "C:\\Users\\Patrick Admin\\development\\terraform-providers\\terraform-provider-okta\\terraform_pkcs1.key"
}

resource "okta_group" "example_group" {
  name = "Example Group"
}

resource "okta_group" "aws_users" {
  name = "aws_users"
  skip_users = true
}

resource "okta_user" "pmdepr" {
  first_name         = "Patrick"
  last_name          = "DePratti"
  login              = "pdepratti@pm.me"
  email              = "pdepratti@pm.me"
  city               = "Brewster"
  country_code       = "US"
  department         = "IT"
  display_name       = "Patrick DePratti"
  locale             = "en_US"
  mobile_phone       = "8602994883"
  nick_name          = "Pat"
  postal_address     = "15 Pine Bluff Rd"
  preferred_language = "en-us"
  primary_phone      = "8602994883"
  state              = "MA"
  street_address     = "15 Pine Bluff Rd."
  timezone           = "America/New_York"
  title              = "Director"
  user_type          = "Employee"
  zip_code           = "02631"
}

  resource "okta_user_group_memberships" "pmdepr" {
  user_id = okta_user.pmdepr.id
  groups = [
    okta_group.example_group.id,
    okta_group.aws_users.id
    ]
}