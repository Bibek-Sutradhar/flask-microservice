resource "aws_route53_record" "site_domain" {
    zone_id = var.hosted-zone-id
    name    = var.record-name
    type    = "A"

    alias {
        name                    = var.alb-dns-name
        zone_id                 = var.alb-zone-id
        evaluate_target_health  = true
    }
}
