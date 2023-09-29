{{-
    config(
      materialized = "table", 
      tags = ["analyse"],
      alias = 'purchases_by_age_range'
    )
-}}

{%- set edges = [20, 40, 60, 80] -%}

WITH customers_age_range AS (
  select *, (
    select case 
    {%- for edge in edges %}
      {%- if loop.first %}
      when (date_diff(current_date(), birthdate, year) < {{ edge }}) then '{{ edge }}-'
      {%- endif %}
      {%- if not loop.last %}
      when (date_diff(current_date(), birthdate, year) between {{ edge }} and {{ loop.nextitem }}) then '{{ edge }}-{{ loop.nextitem }}'
      {%- else  %}
      else '{{ edge }}+' end as age_range
      {%- endif %}  
    {%- endfor %} 
  ) AS age_range
  FROM {{ ref("customers__r") }} as c
)
SELECT sum(purchases) as purchases_sum, 
        age_range
FROM customers_age_range
GROUP BY age_range
ORDER BY age_range
