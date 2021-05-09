resource "aws_db_instance" "rds-mysql-avatarindash-stg" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.small"
  name                 = "rds_mysql_avatarindash_stg"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  count                  = 1
  db_subnet_group_name    = "db-subnet-group-avatarindash-stg"
  vpc_security_group_ids  =  [aws_security_group.security_group-db-avatarindash-stg.id]
}
