{{
    config(
        materialized = 'table',
        tags = ['raw'],
        alias = "customers"
    )
}}

{{- load_data_from_bucket(
    storage_uri="gs://terraform-ambient-stone-394013/data/customers",
    table_name="customers") -}}

SELECT * FROM `{{ target.dataset }}.customers`
