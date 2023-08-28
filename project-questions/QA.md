1. CHECKING PRODUCT CATEGORY FROM RAW TABLE
   
    SELECT "productCategoryV2", count("productCategoryV2")
    FROM public.raw_all_sessions
    GROUP BY public.raw_all_sessions."productCategoryV2"

2. CHECKING THE PRODUCT CATEGORY AFTER CLEANING AND TAKING THE ROOT WORD
    SELECT productcategory, count(productcategory)
    FROM all_sessions
    GROUP BY productcategory

   
