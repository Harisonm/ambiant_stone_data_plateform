{% macro load_data_from_bucket(storage_uri, table_name) %}
{% do log("Importing data from " ~ storage_uri ~ "/*") %}
{% set file_uri = storage_uri ~ "/*" -%}

{%- set data_import -%}
    load data overwrite {{ target.dataset }}.{{ table_name }}
    from
        files(
            format = 'JSON', uris = ["{{ file_uri }}"]
        )
    ;
{%- endset -%}

{%- do run_query(data_import) %}
{% endmacro %}
