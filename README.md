# Şehirler Bazında Toplam Sipariş Miktarlarının Hesaplanması
" Görüntülediğiniz SQL senaryosu, BTK Akademi adresinde bulunan "Uygulamalarla SQL Öğreniyorum" eğitiminden pratik yapma amacıyla alınmıştır. Eğitimde kullanılan veri tabanını, eğitimin dökümantasyon kısmından görüntüleyebilirsiniz. "


Bu proje, şehirler bazında toplam sipariş tutarlarını, 
adetlerini ve sayısını hesaplayan bir SQL sorgusunu içerir. 
Sorgu, bir e-ticaret platformu için sipariş verilerini analiz etmek amacıyla yazılmıştır.

Bu sorgu, her şehir için:
- Toplam sipariş tutarını,
- Toplam sipariş adedini,
- Toplam sipariş sayısını
hesaplar ve şehirleri alfabetik olarak sıralar.

INNER JOIN işlemleri ile ilgili tablolar birleştirilmiştir.
- ORDERS: Siparişlerin bulunduğu ana tablo.
- USERS: Siparişi veren kullanıcıların bilgilerini içerir.
- ADDRESS, CITIES, TOWNS, DISTRICTS: Siparişlerin gönderildiği adreslerin şehir, ilçe ve mahalle bilgilerini içerir.
- PAYMENTS: Siparişe ait ödeme bilgilerini içerir.
- INVOICES: Siparişe ait fatura bilgilerini içerir.
- ORDERDETAILS: Sipariş detaylarını içerir (ürünler ve miktarları).
- ITEMS: Siparişte yer alan ürün bilgilerini içerir.

- GROUP BY işlemi ile şehir bazında veriler gruplanmıştır.
- SUM(OD.LINETOTAL): Şehir bazında siparişlerin toplam tutarını hesaplar.
- SUM(OD.AMOUNT): Şehir bazında satılan toplam ürün miktarını hesaplar.
- COUNT(OD.ID): Şehir bazında verilen toplam sipariş sayısını hesaplar.
- ORDER BY CT.CITY: Şehirler alfabetik sıraya göre listelenir.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Calculating Total Order Quantities by City
" The SQL scenario you are viewing is taken from the "Learning SQL with Applications" training on BTK Academy for practice purposes. You can view the database used in the training from the documentation section of the training. "

This project includes a SQL query that calculates total order amounts, quantities and counts by city.

The query was written to analyze order data for an e-commerce platform.

This query calculates for each city:
- Total order amount,
- Total order quantity,
- Total number of orders
and sorts the cities alphabetically.

The tables related to INNER JOIN operations are combined.
- ORDERS: The main table where the orders are located.
- USERS: Contains the information of the users who placed the order.
- ADDRESS, CITIES, TOWNS, DISTRICTS: Contains the city, district and neighborhood information of the addresses to which the orders are sent.
- PAYMENTS: Contains the payment information of the order.
- INVOICES: Contains the invoice information of the order.
- ORDERDETAILS: Contains the order details (products and quantities).
- ITEMS: Contains the product information included in the order.

- Data is grouped by city with GROUP BY operation.
- SUM(OD.LINETOTAL): Calculates the total amount of orders by city.
- SUM(OD.AMOUNT): Calculates the total amount of products sold by city.
- COUNT(OD.ID): Calculates the total number of orders placed by city.
- ORDER BY CT.CITY: Cities are listed in alphabetical order.
