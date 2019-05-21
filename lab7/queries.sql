SELECT COUNT(*)
FROM part_nyc P
WHERE P.on_hand > 70;

SELECT SUM((SELECT COUNT(P.on_hand)
FROM part_nyc P, color C
WHERE P.color = C.color_id AND C.color_name = 'Red')
+
(SELECT COUNT(S.on_hand)
FROM part_sfo S, color C
WHERE S.color = C.color_id AND C.color_name = 'Red'))
AS sum;

SELECT S.supplier_name 
FROM supplier S
WHERE
(SELECT SUM(P.on_hand)
FROM part_nyc P
WHERE P.supplier = S.supplier_id)
>
(SELECT SUM(F.on_hand)
FROM part_sfo F
WHERE F.supplier = S.supplier_id)
GROUP BY S.supplier_name;


SELECT DISTINCT S.supplier_id, S.supplier_name
FROM supplier S, part_nyc N
WHERE S.supplier_id = N.supplier AND N.part_number
IN
(SELECT N.part_number
FROM supplier S, part_nyc N
WHERE S.supplier_id = N.supplier
EXCEPT
SELECT F.part_number
FROM supplier S, part_sfo F
WHERE S.supplier_id = F.supplier)
GROUP BY supplier_id, supplier_name;


UPDATE part_nyc 
SET on_hand = on_hand -10
WHERE on_hand >= 10;

DELETE FROM part_nyc 
WHERE ON_HAND < 30;
