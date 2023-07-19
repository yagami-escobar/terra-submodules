output "instance_ip" {
  value = aws_instance.yagami-i1.*.public_ip
}