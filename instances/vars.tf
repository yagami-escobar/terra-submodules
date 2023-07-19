variable "ami_id" {
  type        = string
  default     = "AMI_ID"
  description = "Identificador del AMI"
}

variable "instance_type" {
  type        = string
  default     = "INS_TYPE"
  description = "Tipo de instancia"
}

variable "tags" {
  type = map(any)
}

variable "key_name" {
  type = string
}


variable "sg_name" {
  type = string
}

variable "ingress_rules" {
  type = map(any)
  description = "Reglas de ingreso"
}

variable "egress_rules" {
  type = map(any)
  description = "Reglas de egreso"
}


variable "private_key" {
  type = string
  description = "Ruta del Private_Key"
}