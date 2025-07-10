select
    customer_id,
    customer_name,
    is_frequent_buyer
from {{ ref('int_customers_with_frequent_buying_habits') }}