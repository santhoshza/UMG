# user
resource "aws_iam_user" "UMG" {
    name = "umg"
}

resource "aws_iam_access_key" "lb" {
  user    = "${aws_iam_user.UMG.name}"
}



