variable "region" {}

variable "access" {}

variable "secret" {}

variable "username" {
  type    = list(string)
  default = ["Yousaf", "Rahul", "Abhilash"]
}
