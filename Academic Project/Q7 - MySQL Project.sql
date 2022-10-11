-- Identify the optimum carton (carton with the least volume whose volume is greater than the total volume of all items 
-- (len * width * height * product_quantity)) for a given order

SELECT 
	C.CARTON_ID,
    C.LEN*C.WIDTH*C.HEIGHT AS CARTON_VOL
FROM CARTON AS C
WHERE C.LEN*C.WIDTH*C.HEIGHT > 
	(SELECT SUM(LEN*WIDTH*HEIGHT*PRODUCT_QUANTITY) AS TOTAL_VOL
     FROM PRODUCT AS P
     JOIN ORDER_ITEMS AS OI ON OI.PRODUCT_ID = P.PRODUCT_ID
     WHERE ORDER_ID = 10006)
ORDER BY CARTON_VOL ASC
LIMIT 1;
