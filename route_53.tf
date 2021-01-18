resource "aws_route53_record" "www" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_lb.alb.dns_name
    zone_id                = data.aws_elb_hosted_zone_id.alb.id
  }
}
data "aws_elb_hosted_zone_id" "alb" {

}