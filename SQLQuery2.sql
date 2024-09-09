-- ÞEHÝRLERE GÖRE TOPLAM VERÝLEN SÝPARÝÞ MÝKTARLARI
-- REFERANS TABLOMUZ 'ORDERS' TABLOSUDUR
SELECT
CT.CITY AS SEHIRADI,
SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTARI, --ORDERS tablosunda verilen sipariþler þehirler için syrý ayrý listelenmiþ durumdaydý. Örneðin 'X' þehrinde verilen sipariþler 'Y' adet iste bu 'Y' satýr kadar görüntüleniyordu. Amacýmýz doðrultusunda bu satýrlarý topladýk. 
SUM(OD.AMOUNT) AS TOPLAMSIPARIS_ADEDI, 
COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI --Burada satýr saydýracaðýmýz için 'COUNT' kullandýk.


FROM ORDERS O
INNER JOIN USERS U ON U.ID=O.USERID
INNER JOIN ADDRESS A ON A.ID=O.ADDRESSID
INNER JOIN CITIES CT ON CT.ID=A.CITYID
INNER JOIN TOWNS T ON T.ID=A.TOWNID
INNER JOIN DISTRICTS D ON D.ID=A.DISTRICTID
INNER JOIN PAYMENTS P ON P.ORDERID=O.ID
INNER JOIN INVOICES I ON I.ORDERID=O.ID
INNER JOIN ORDERDETAILS OD ON OD.ORDERID=O.ID
INNER JOIN ITEMS ITM ON ITM.ID=OD.ITEMID


GROUP BY CT.CITY --(aggregate fonksiyonlarý için 'groupby' kullandýk)
ORDER BY CT.CITY -- ( þehirleri alfabetik olarak sýraladýk)