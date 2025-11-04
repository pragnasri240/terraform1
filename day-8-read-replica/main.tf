
# Read Replica (for existing RDS 'database-1')
resource "aws_db_instance" "read_replica" {
  identifier           = "my-read-replica"
  replicate_source_db  = "database-1"   # existing RDS identifier
  instance_class       = "db.t3.micro"
}
