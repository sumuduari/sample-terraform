resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "docdb-cluster-avatarindash-stg"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "mustbeeightchars"
  db_subnet_group_name    = "db-subnet-group-avatarindash-stg"  
  vpc_security_group_ids  =  [aws_security_group.security_group-doc_db-avatarindash-stg.id]
}