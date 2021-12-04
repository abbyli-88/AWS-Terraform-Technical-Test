region            = "ap-southeast-2"
instance_count    = "3"
ami               = "ami-00abf0511a7f4cee5"
instance_type     = "t3.micro"
availability_zone = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
subnet_name       = ["subnet-az-2a", "subnet-az-2b", "subnet-az-2c"]
key_name          = ["key1", "key2", "key4"]