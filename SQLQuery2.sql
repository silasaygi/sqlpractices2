-- ŞEHİRLERE GÖRE VERİLEN TOPLAM SİPARİŞ MİKTARLARI
-- REFERANS TABLOMUZ 'ORDERS' TABLOSUDUR
SELECT
CT.CITY AS SEHIRADI,
SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTARI, --ORDERS tablosunda verilen siparişler şehirler  için ayrı 
  --ayrı listelenmiş durumdaydi. Örneğin 'X' şehrinde verilen siparişler 'Y' adet ise bu 'Y' satir kadar görüntüleniyordu. Amacimiz dogrultusunda bu satirlari topladik. 
SUM(OD.AMOUNT) AS TOPLAMSIPARIS_ADEDI, 
COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI --Burada satir saydiracagimiz için "COUNT" kullandik.


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


GROUP BY CT.CITY --(aggregate fonksiyonlari için 'groupby' kullandik)
ORDER BY CT.CITY -- ( şehirleri alfabetik olarak siraladik)
