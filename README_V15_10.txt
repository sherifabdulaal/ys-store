YS Store V15.10 – Full Product Management

V15.9 remains unchanged.

New Admin migration:
1. Open index.html and login to Admin.
2. Click IMPORT 40 CATALOG PRODUCTS.
3. The 40 local catalog images are uploaded to Supabase Storage (product-images).
4. Each catalog item is inserted into public.products and stock rows are created in public.product_variants.
5. After import, the products appear as normal numeric-ID products in Product Management and can be edited like existing products.

Editable after import: image, additional images, name, category, price, old price, badge, SKU, description, active/hidden, colors, sizes, variant stock, card/detail image settings, and Show in Home – NEW PRODUCT.

Important: Run the import once. Existing SKU/name deduplication prevents imported catalog duplicates from being shown alongside Supabase products.
