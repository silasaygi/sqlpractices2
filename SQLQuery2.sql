-- �EH�RLERE G�RE TOPLAM VER�LEN S�PAR�� M�KTARLARI
-- REFERANS TABLOMUZ 'ORDERS' TABLOSUDUR
SELECT
CT.CITY AS SEHIRADI,
SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTARI, --ORDERS tablosunda verilen sipari�ler �ehirler i�in syr� ayr� listelenmi� durumdayd�. �rne�in 'X' �ehrinde verilen sipari�ler 'Y' adet iste bu 'Y' sat�r kadar g�r�nt�leniyordu. Amac�m�z do�rultusunda bu sat�rlar� toplad�k. 
SUM(OD.AMOUNT) AS TOPLAMSIPARIS_ADEDI, 
COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI --Burada sat�r sayd�raca��m�z i�in 'COUNT' kulland�k.


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


GROUP BY CT.CITY --(aggregate fonksiyonlar� i�in 'groupby' kulland�k)
ORDER BY CT.CITY -- ( �ehirleri alfabetik olarak s�ralad�k)