select
  sku as product_id,
  name as product_name,
  type as product_type,
  price / 100 as product_price, -- convert from cents to dollars
  description as product_description
from raw.raw_products