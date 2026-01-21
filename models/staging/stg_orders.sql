select
  id as order_id,
  customer as customer_id,
  ordered_at as order_date,
  store_id as store_id,
  subtotal / 100 as subtotal, -- convert from cents to dollars
  tax_paid / 100 as tax_paid, -- convert from cents to dollars
  order_total / 100 as order_total -- convert from cents to dollars
from raw.raw_orders