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
  private_key = "${secrets.PKCS1_KEY}"
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
  last_name          = "Tester"
  login              = "test@pm.me"
  email              = "test@pm.me"
  city               = "Test"
  country_code       = "US"
  department         = "IT"
  display_name       = "Patrick Tester"
  locale             = "en_US"
  mobile_phone       = "602998888"
  nick_name          = "Tester"
  postal_address     = "15 Test St"
  preferred_language = "en-us"
  primary_phone      = "8602998888"
  state              = "OH"
  street_address     = "15 Test St."
  timezone           = "America/New_York"
  title              = "Director"
  user_type          = "Employee"
  zip_code           = "02021"
}

  resource "okta_user_group_memberships" "pmdepr" {
  user_id = okta_user.pmdepr.id
  groups = [
    okta_group.example_group.id,
    okta_group.aws_users.id
    ]
}
