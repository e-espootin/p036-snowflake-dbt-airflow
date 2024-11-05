# provider "aws" {
#   region  = "us-east-1"  # Change this to the region you want your bucket in

# }

# resource "aws_s3_bucket" "ebi_bucket" {
#   bucket = "ebi-pproj-snowflake_dbt_bk"
# #   acl    = "private"  # Set the ACL according to your needs; 'private' means no public access

#   tags = {
#     Name        = "ebi-pproj-snowflake_dbt_bk"
#     Environment = "Production"
#   }
# }