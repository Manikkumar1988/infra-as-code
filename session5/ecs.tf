module "ecs" {
  source = "./modules/ecs/"

  prefix                = var.prefix
  region                = var.region
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnets
  alb_target_group_arn  = aws_lb_target_group.tg.arn
  alb_security_group_id = aws_security_group.lb_sg.id
  db_name               = var.db_name
  db_username           = var.db_username
  db_secret_arn         = "arn:aws:secretsmanager:us-east-1:160071257600:secret:dev/db-mk-iac-lab-5-dTpFyI"
  db_secret_key_id      = "dev/db-mk-iac-lab-5"
  db_address            = "mk-iac-lab-5-db.clidb2xnr6qm.us-east-1.rds.amazonaws.com"
}