resource "aws_route53_record" "expense" {
    for_each = aws_instance.expense
    zone_id = data.aws_route53_zone.expense.id

    #backend.daws81s.online
    name    = each.key == "frontend-prod" ? data.aws_route53_zone.expense.name : "${each.key}.${data.aws_route53_zone.expense.name}"
    type    = "A"
    ttl     = 1
    records = startswith(each.key, "frontend") ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true
}