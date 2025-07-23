{% test test_given_expression(model, expression) %}

SELECT
  *,
  CURRENT_TIMESTAMP AS tested_at,
  CASE
    WHEN {{ expression }} THEN 'PASS'
    ELSE 'FAIL'
  END AS test_result
FROM {{ model }}

{% endtest %}