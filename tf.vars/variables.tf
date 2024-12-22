variable "instance_type" {
    type = map
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "True"
    }
}   

variable "environment" {
    type = string
}

variable "tags" {
    type = map
}