

variable "role" {
    description = "The role for the Snowflake account"
    type        = string
    default = "DBT_ROLE"
}

variable "database" {
  description = "The role for the Snowflake account"
    type        = string
    default = "db_airbnb"
}

variable "schema" {
  description = "The role for the Snowflake account"
    type        = string
    default = "dbt_schema"
  
}

variable "service_user_role" {
  description = "value for the service user role"
    type        = string
    default = "TF_SVC_ROLE"
}

variable "service_dbt_user" {
  description = "value for the service dbt user"
    type        = string
    default = "TF_SVC_DBT_USER"
}


#####
variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
  default = file(var.AWS_ACCESS_KEY_ID)
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Key"
  type        = string
  default = file(var.AWS_SECRET_ACCESS_KEY)
  
}