{% macro grant_select(schema=target.schema, role=target.role) %}
    {% set query %}
        grant usage on {{ schema }} to {{ role }}
        grant select on all tables in schema {{ schema }} to {{ role }}
        grant select on all views in schema {{ schema }} to {{ role }}
    {% endset %}

    {% do run_query(query) %}
{% endmacro %}

