resource "aws_iam_user" "myusers" {
  count = length(var.username)
  name  = element(var.username, count.index)
}


output "user_arn" {
  value = aws_iam_user.myusers.*.arn
}

resource "aws_iam_user_policy" "myuser_policy" {
  count = length(var.username)
  name  = "new_user_policy"
  user  = element(var.username, count.index)

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
EOF

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_iam_user.myusers]
}