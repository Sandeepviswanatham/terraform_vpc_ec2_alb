# create target group
resource "aws_lb_target_group" "target-group" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id      ="vpc-0d62915df3fd355c8"
}
# create ALB
resource "aws_lb" "test" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-089abbdfcd3261e26"]
  subnets            = ["subnet-0379ea39aabcda564","subnet-0f692f52af26e5b07"]

tags = {
    Name = "alb"
}
}
# #creating listener
 resource "aws_lb_listener" "alb-listener" {
   load_balancer_arn = "arn:aws:elasticloadbalancing:ap-southeast-1:629992731367:loadbalancer/app/alb/e8203a62e0287e42"
   port              = "80"
   protocol          = "HTTP"
  

   default_action {
     type             = "forward"
     target_group_arn = aws_lb_target_group.target-group.arn
   }
 }
# # attachment
#  resource "aws_lb_target_group_attachment" "target-group" {
#    target_group_arn = aws_lb_target_group.target-group.arn
#    target_id        = aws_instance.target-group.id
# }