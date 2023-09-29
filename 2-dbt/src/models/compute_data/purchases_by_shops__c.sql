{{-
    config(
        materialized = "table",
        tags = ["analyse"],
        alias = 'purchases_by_shops'
    )
-}}

select sum(purchases) as total_purchase, shop_name
from {{ ref("customers__r") }} as c
join {{ ref("shops__r") }} as s
on c.shop_id = s.id
group by shop_name
order by shop_name
