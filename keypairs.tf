resource "aws_key_pair" "rjvprofilekey" {
  key_name   = "rjvprofilekey"
  public_key = file(var.Pub_Key)
}