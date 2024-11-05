terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.87"
    }
  }
}

provider "snowflake" {
    alias   = "DBT_ROLE"
    role  = var.role
}


resource "snowflake_database" "db" {
    name = var.database
}


resource "snowflake_schema" "schema" {
  database   = var.database
  name       = var.schema
#   is_managed = false
}

resource "snowflake_warehouse" "warehouse" {
  name           = var.database
  warehouse_size = "xsmall"
  auto_suspend   = 60
}

resource "snowflake_role" "role" {
  provider = snowflake.DBT_ROLE
  name     = var.service_user_role #
}

resource "snowflake_grant_privileges_to_account_role" "database_grant" {
  provider          = snowflake.DBT_ROLE
  privileges        = ["USAGE"]
  account_role_name = snowflake_role.role.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.db.name
  }
}



resource "snowflake_grant_privileges_to_account_role" "schema_grant" {
  provider          = snowflake.DBT_ROLE
  privileges        = ["USAGE"]
  account_role_name = snowflake_role.role.name
  on_schema {
    schema_name = "\"${snowflake_database.db.name}\".\"${snowflake_schema.schema.name}\""
  }
}

resource "snowflake_grant_privileges_to_account_role" "warehouse_grant" {
  provider          = snowflake.DBT_ROLE
  privileges        = ["USAGE"]
  account_role_name = snowflake_role.role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.warehouse.name
  }
}

resource "tls_private_key" "svc_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "snowflake_user" "user" {
    provider          = snowflake.DBT_ROLE
    name              = var.service_dbt_user #
    default_warehouse = snowflake_warehouse.warehouse.name
    default_role      = snowflake_role.role.name
    default_namespace = "${snowflake_database.db.name}.${snowflake_schema.schema.name}"
    rsa_public_key    = substr(tls_private_key.svc_key.public_key_pem, 27, 398)
}

resource "snowflake_grant_privileges_to_account_role" "user_grant" {
  provider          = snowflake.DBT_ROLE
  privileges        = ["MONITOR"]
  account_role_name = snowflake_role.role.name  
  on_account_object {
    object_type = "USER"
    object_name = snowflake_user.user.name
  }
}

resource "snowflake_grant_account_role" "grants" {
  provider  = snowflake.DBT_ROLE
  role_name = snowflake_role.role.name
  user_name = snowflake_user.user.name
}

/*
resource "snowflake_stage" "my_stage" {
    name     = "my_s3_stage_2"
    database = var.database
    schema   = var.schema
    url      = "s3://ebi-generalpurpose-bucket/snowflake-dbt/"
    credentials = "AWS_KEY_ID='${var.AWS_ACCESS_KEY_ID}' AWS_SECRET_KEY='${var.AWS_SECRET_ACCESS_KEY}'"

}
*/