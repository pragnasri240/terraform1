
resource "aws_db_instance" "default" {
  allocated_storage       = 10
  db_name                 = "mydb"
  identifier              = "database-1"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "pragnasridhara"
  db_subnet_group_name    = aws_db_subnet_group.sub-grp.id
  parameter_group_name    = "default.mysql8.0"

  # Enable backups and retention
  backup_retention_period  = 7   # Retain backups for 7 days
  backup_window            = "02:00-03:00" # Daily backup window (UTC)

  # Enable monitoring (CloudWatch Enhanced Monitoring)
  #monitoring_interval      = 60  # Collect metrics every 60 seconds
  #monitoring_role_arn      = aws_iam_role.rds_monitoring.arn

  # Enable performance insights
  # performance_insights_enabled          = true
  # performance_insights_retention_period = 7  # Retain insights for 7 days

  # Maintenance window
  maintenance_window = "sun:04:00-sun:05:00"  # Maintenance every Sunday (UTC)

  # Enable deletion protection (to prevent accidental deletion)
  deletion_protection = true

  # Skip final snapshot
  skip_final_snapshot = true
}

# # IAM Role for RDS Enhanced Monitoring
#resource "aws_iam_role" "rds_monitoring" {
  #name = "rds-monitoring-role"
  #assume_role_policy = jsonencode({
    #Version = "2012-10-17"
    #Statement = [{
      #Action = "sts:AssumeRole"
      #Effect = "Allow"
      #Principal = {
        #Service = "monitoring.rds.amazonaws.com"
      #}
   # }]
  #})
#}

#IAM Policy Attachment for RDS Monitoring
#resource "aws_iam_role_policy_attachment" "rds_monitoring_attach" {
  #role       = aws_iam_role.rds_monitoring.name
  #policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
#}


# resource "aws_db_subnet_group" "sub-grp" {
#   name       = "customrds"
#   subnet_ids = ["sub-063301814a7fca6dc", "sub-0c6707db5bc43037d"]

#   tags = {
#     Name = "rds subnet group"
#   }
# }




####### with data source ###########
data "aws_subnet" "subnet-1" {
  filter {
    name   = "tag:Name"
    values = ["subnet-1"]
  }
}

data "aws_subnet" "subnet-2" {
  filter {
    name   = "tag:Name"
    values = ["subnet-2"]
  }
}
resource "aws_db_subnet_group" "sub-grp" {
  name       = "mycutsubnet"
  subnet_ids = ["subnet-04e1a87b4c5969a74", "subnet-0b0ebd7cacc12e077"]

  tags = {
    Name = "rds subnet group"
  }
}
