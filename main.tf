variable "cidr_blocks" {
    description = "list of cidr blocks and names"    
    type = list(object({
        cidr_block = string
        name = string
    }))

}

resource "aws_vpc" "k8s-vpc" {
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
        Name: var.cidr_blocks[0].name
    }
}
