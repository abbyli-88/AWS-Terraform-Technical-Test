output "instance_id" {
  value = module.ec2.*.ec2-instance-id
}
output "key-pairs_map" {
  value = zipmap(module.key-pair.*.public_key,module.key-pair.*.private_key)
  sensitive = true
}