## --------------------------------
## Certifiacte
## --------------------------------

resource "aws_iam_server_certificate" "bg-cert" {
  name_prefix      = "bgapp-cert"
  certificate_body = file("templates/certs/bg-cert.pem")
  private_key      = file("templates/certs/bg-key.pem")

  lifecycle {
    create_before_destroy = true
  }
}
