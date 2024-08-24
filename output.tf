/*
output "variable_value" {
  value = "hello ${var.var_1}, your age is ${var.age_1}"
}
*/
#terraform plan -var "var_1=ajay", if we run terraform plan then ask for var_1 value. 
#terraform plan -var "var_1=ajay" -var "age_1=32"
output "print_public_key" {
  value = file("${path.module}/id_rsa.pub")
}