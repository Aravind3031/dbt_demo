{% macro log_audit_start(model) %}
    {% do run_query(
        "INSERT INTO AUDIT.dbt_audit_logs (model_name, run_start_time)
         VALUES ('" ~ model.name ~ "', CURRENT_TIMESTAMP)"
    ) %}
{% endmacro %}

{% macro log_audit_end(model) %}
    {% do run_query(
        "UPDATE AUDIT.dbt_audit_logs
         SET run_end_time = CURRENT_TIMESTAMP
         WHERE model_name = '" ~ model.name ~ "' AND run_end_time IS NULL"
    ) %}
{% endmacro %}