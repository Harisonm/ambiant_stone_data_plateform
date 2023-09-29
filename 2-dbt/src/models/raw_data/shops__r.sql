{{
    config(
        materialized = 'table',
        tags = ['raw'],
        alias = "shops"
    )
}}

{{ load_data_from_bucket(
    storage_uri="gs://terraform-ambient-stone-394013/data/shops",
     table_name="shops") }}

SELECT * FROM `{{ target.dataset }}.shops`
