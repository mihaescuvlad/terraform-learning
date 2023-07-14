resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.inf_env}-bucket-0"
}

