resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.inf_env}-bucket-0"
}

resource "aws_s3_object" "s3_object" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  for_each = fileset("${var.s3_source}", "**")

  key = "${aws_s3_bucket.s3_bucket.bucket}/${each.value}"
  source = "${var.s3_source}/${each.value}"
  etag = filemd5("${var.s3_source}/${each.value}")
}
