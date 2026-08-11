ngs={
    ng1={
        name="shivang11"
        location="centralindia"
        resource_group_name="shiva_rg3"
    }
}
pips = {
    pip1={
        name="shivapip11"
        location="centralindia"
        resource_group_name="shiva_rg3"
        allocation_method="Static"
        sku="Standard"
        }
}
pipassociations = {
    pipassociation1={
         nat_gateway ="ng1"
         public_ip="pip1"

    }
}