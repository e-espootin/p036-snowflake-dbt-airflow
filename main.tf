provider "snowflake" {
    alias   = "DBT_ROLE"
    role  = "DBT_ROLE"
    # alias       = "main"
    # SNOWFLAKE_ACCOUNT     = var.SNOWFLAKE_ACCOUNT
    # SNOWFLAKE_AUTHENTICATOR = var.SNOWFLAKE_AUTHENTICATOR
    # SNOWFLAKE_PRIVATE_KEY = var.SNOWFLAKE_PRIVATE_KEY
    # SNOWFLAKE_USER = var.SNOWFLAKE_USER

    # account   = var.SNOWFLAKE_ACCOUNT
    # username  = var.SNOWFLAKE_USER
    # password  = var.SNOWFLAKE_PRIVATE_KEY
    # role      = "DBT_ROLE"
    # warehouse = "dbt_wh"
    # database  = "dbt_db"
    # schema    = "dbt_schema"
}

module "azterraform" {
  source = "./terraform"
}