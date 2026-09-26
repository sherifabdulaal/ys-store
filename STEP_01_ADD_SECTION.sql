-- YS Store V15.10.16 - Step 01
-- Add audience section without changing existing category values.

ALTER TABLE public.products
ADD COLUMN IF NOT EXISTS section text;

-- All existing products were part of the original men's catalog.
UPDATE public.products
SET section = 'Men'
WHERE section IS NULL OR btrim(section) = '';

-- New products default to Men until the Admin UI is upgraded in the next step.
ALTER TABLE public.products
ALTER COLUMN section SET DEFAULT 'Men';

ALTER TABLE public.products
ALTER COLUMN section SET NOT NULL;

COMMENT ON COLUMN public.products.section IS
'Audience section: Men, Ladies, Kids, or Accessories. Product type remains in category.';

-- Verification only
SELECT id, name, section, category, active
FROM public.products
ORDER BY id;
