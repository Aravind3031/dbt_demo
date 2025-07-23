{% snapshot snap_customers %}

select * 
from raw.raw_customers

{% endsnapshot %}