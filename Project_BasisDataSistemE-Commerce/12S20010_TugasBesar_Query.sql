CREATE DATABASE Basdat2022_12_SI

USE Basdat2022_1_SI


CREATE TABLE PENJUAL (
	ID_PENJUAL	 VARCHAR(20) NOT NULL,
	USERNAME	VARCHAR(20),
	PASWORD	VARCHAR(20),
	ALAMAT		VARCHAR(20),
	NO_TELEPON	VARCHAR(20),
	KODE_POS	VARCHAR(20),
	KOTA		VARCHAR(20),
	PRIMARY KEY (ID_PENJUAL));

CREATE TABLE PEMBELI (
	ID_PEMBELI	VARCHAR(20) PRIMARY KEY,
	USERNAME	 VARCHAR(20),
	PASWORD		VARCHAR(20),
	ALAMAT		VARCHAR(20),
	NO_TELEPON	VARCHAR(20),
	KODE_POS	VARCHAR(20),
	KOTA		VARCHAR(20))

CREATE TABLE TRANSAKSI (
  ID_BARANG		VARCHAR(20),
  TGL_TRANSAKSI   VARCHAR(20) NOT NULL,
  ID_TRANSAKSI	VARCHAR(20),
  ID_PEMBELI	VARCHAR(20),
  JENIS_TRANSAKSI VARCHAR(15) NOT NULL,
  PRIMARY KEY(ID_TRANSAKSI),
  FOREIGN KEY(ID_TRANSAKSI)
  REFERENCES PEMBELI (ID_PEMBELI));


CREATE TABLE DAFTAR (
	ID_PENJUAL	VARCHAR(20),
	ID_PENDAFTARAN	VARCHAR(20),
	ID_BARANG		VARCHAR(20) PRIMARY KEY,
	FOREIGN KEY (ID_PENJUAL)
	REFERENCES PENJUAL (ID_PENJUAL));

CREATE TABLE BARANG (
	ID_BARANG	VARCHAR(20) PRIMARY KEY,
	HARGA		INT,
	ID_TRANSAKSI VARCHAR(20),
	JUMLAH_STOK	VARCHAR(15),
	MEREK_BARANG	CHAR(15),
	ID_DAFTAR	VARCHAR(20));


ALTER TABLE BARANG ADD CONSTRAINT
	FK_BARANG_TRANSAKSI FOREIGN KEY
	(
	ID_TRANSAKSI
	) REFERENCES TRANSAKSI
	(
	ID_TRANSAKSI
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
ALTER TABLE DAFTAR ADD CONSTRAINT
	FK_DAFTAR_BARANG FOREIGN KEY
	(
	ID_BARANG
	) REFERENCES BARANG
	(
	ID_BARANG
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	

	DROP TABLE BARANG

CREATE TABLE KIRIM(
	ID_PENJUAL		VARCHAR(20),
	ALAMAT			VARCHAR(20),
	ID_BARANG		VARCHAR(20),
	ID_PENGIRIMAN	VARCHAR(20) PRIMARY KEY,
	FOREIGN KEY (ID_PENJUAL) REFERENCES PENJUAL(ID_PENJUAL), FOREIGN KEY (ID_BARANG) REFERENCES BARANG (ID_BARANG));
	
DROP TABEL KIRIM


--- NOMOR 3A ISERTING DATA---
---PENJUAL---
INSERT INTO PENJUAL VALUES ('DN01', 'SUPRIANTO', '12S14', 'JL_MERDEKA',082273671252,2889,'Pasid'),
('DN02', 'MASTUARI', '12S24', 'JL_PILAR',081260813831,2889,'Psid'),
('DN03', 'ANTO', '12S34', 'JL_KENANGA',082165335651,2887,'Medan'),
('DN04', 'NIVERTITI', '12S25', 'JL_DANAUTOBA',081370913100,2886,'Balige'),
('DN05', 'NIVER', '12S26', 'JL_DEL_KOTA',081262247137,2885,'Tarutung');
SELECT*FROM PENJUAL;


---PEMBELI---
INSERT INTO PEMBELI VALUES (12502, 'SUPRI','12S14', 'JL_PANDU',082266880407,2771,'Tarutung'),
(12506, 'ANTO','12S24', 'JL_PANDU',081346379870,2772,'Siantar'),
(12508, 'MASTU','12S34', 'JL_PODOMORO',082164677613,2773,'Medan'),
(12511, 'ANTON','12S25', 'JL_PANDUNI',082253670987,2774,'Balige'),
(12515, 'NIVER','12S26', 'JL_PODINI',082134560987,2775,'Jakarta');
SELECT * FROM PEMBELI;

---TRANSAKSI---
INSERT INTO TRANSAKSI VALUES (1,040221,12502,01,'BNI'),
(2,040221,12506,02,'BNI'),
(3,050221,12508,03,'BRI'),
(4,050221,12511,04,'BRI'),
(5,060221,12515,05,'BCA');
SELECT * FROM TRANSAKSI;

---BARANG---
INSERT INTO BARANG VALUES (01, 150000,12502,11,'GUCCI','X1'),
(02, 150000,12502, 12, 'GUCCI','X2'),
(03, 300000,12502, 16, 'ADIODAS','X3'),
(04, 40000,12502, 19, 'ZARA','X4'),
(05, 50000,12502, 25, 'NIKE','X5'),
(06, 30000, 12502, 35 , 'ADIDAS', 'X6');
SELECT * FROM BARANG;

---KIRIM---
INSERT INTO KIRIM VALUES ('DN01','JLMERDEKA',01,'JE1101'),
('DN02','JLPILAR',02,'JE1102'),
('DN03','JLKENANGA',03,'JE1103'),
('DN04','JLDANAUTOBA',04,'JE1104'),
('DN05','JLDEL',05,'JE1105');
SELECT * FROM KIRIM;

---DAFTAR---
INSERT INTO DAFTAR VALUES ('DN01',1101,01),
('DN02',1102, 02),
('DN03',1103, 03),
('DN04',1104, 04),
('DN05',1105, 05);
SELECT*FROM DAFTAR;



---3B SELECT*FROM---
SELECT * FROM PEMBELI
SELECT * FROM PENJUAL
SELECT * FROM TRANSAKSI
SELECT * FROM DAFTAR
SELECT * FROM BARANG
SELECT * FROM KIRIM


---3C BASIC QUERY :  (SELECT, UPDATE, SET OPERATORS, AGGREGATE FUNCTION, NULL VALUE)---
--- 1. UPDATE ALAMAT DENGAN ID_PENJUAL = DNO1 MENJADI 'JL_MAHAKAM'
UPDATE PENJUAL
SET ALAMAT = 'JL_MAHAKAM'
WHERE ID_PENJUAL='DN01';
SELECT * FROM PENJUAL

---2. TAMPILKAN SELURUH DATA DARI TABEL PENJUAL DENGAN NAMA YANG BERAWALAN HURUF 'N'
SELECT * FROM PENJUAL
WHERE USERNAME LIKE 'N%'

 ---3 Tampilkan harga tertinggi dan terendah  dari barang. simpan dengan atribut difference
 SELECT MAX(HARGA) - MIN(HARGA) AS DIFFERENCE
 FROM BARANG;


---4.MENAMPILKAN NILAI AWAL DAN AKHIR PADA TABEL BARANG---
SELECT ID_BARANG, HARGA "SALARY", ID_TRANSAKSI, JUMLAH_STOK
FROM BARANG
WHERE HARGA BETWEEN 40000 AND 150000;

--- 5---
 SELECT ID_BARANG, HARGA "SALARY", ID_TRANSAKSI,JUMLAH_STOK,MEREK_BARANG,ID_DAFTAR
 FROM BARANG
 ORDER BY HARGA DESC;
 
 ---6---
 SELECT ID_BARANG, HARGA, ID_TRANSAKSI,JUMLAH_STOK, MEREK_BARANG, ID_BARANG
 FROM BARANG
 WHERE HARGA >= 150000
 AND MEREK_BARANG LIKE 'G%';

 ---7 TAMPILKAN SELURUH ATRIBUT DENGAN HARGA YANG MENDAPATKAN KENAIKAN 5 KALI SIMPAN SEBAGAI SALARY--
 SELECT ID_BARANG, 5*HARGA AS SALARY, ID_TRANSAKSI,JUMLAH_STOK, MEREK_BARANG, ID_DAFTAR
 FROM BARANG
 
 ---8 MENAMPILKAN NILAI DALAM LIST---
 SELECT ID_PENJUAL, ID_PENDAFTARAN, ID_BARANG
 FROM DAFTAR
 WHERE ID_PENDAFTARAN IN ('1101','1102','1105');

 ---9 URUTKAN DATA PADA TABEL BARANG BERDASARKAN HARGA TERENDAH DAN TERBESAR---
 SELECT ID_BARANG, HARGA "SALARY", ID_TRANSAKSI,JUMLAH_STOK,MEREK_BARANG,ID_DAFTAR
 FROM BARANG
 ORDER BY HARGA ASC;




 ---NOMOR 4 : Querying multiple tables, implementing views---
 ---1. Tampilkan harga tertinggi,id_barang, dan merek brang dari produk yang diambil dari tabel barang---
SELECT ID_BARANG, HARGA, MEREK_BARANG
FROM BARANG
WHERE HARGA = (SELECT MAX(HARGA) FROM BARANG);

---2. TAMPILKAN SELURUH DATA TRANSAKSI YANG MEMILIKI JENIS TRANSKSI'BNI'
SELECT*FROM TRANSAKSI
JOIN BARANG
ON BARANG.MEREK_BARANG = TRANSAKSI.ID_PEMBELI
WHERE TRANSAKSI.ID_PEMBELI = ('02');

---3. TAMPILKAN ID PENDAFTARAN DARI TABEL DAFTAR JOIN KE TABEL KIRIM------
SELECT ID_PENDAFTARAN
FROM DAFTAR INNER JOIN KIRIM
ON DAFTAR.ID_PENJUAL = KIRIM.ID_PENJUAL;

---4. 
SELECT MEREK_BARANG
FROM BARANG
WHERE ID_BARANG NOT IN('5');

---5
SELECT ID_PENJUAL
FROM PENJUAL CROSS JOIN PEMBELI
---4B : IMPLEMENTING VIEW---
---1---
CREATE VIEW AUDITBARANG
AS
SELECT ID_BARANG, HARGA, MEREK_BARANG
FROM BARANG
WHERE HARGA = (SELECT MAX(HARGA) FROM BARANG);

SELECT * FROM AUDITBARANG

---2---
CREATE VIEW PENDAFTARAN_BARANG
AS
SELECT ID_PENDAFTARAN
FROM DAFTAR INNER JOIN KIRIM
ON DAFTAR.ID_PENJUAL = KIRIM.ID_PENJUAL;

SELECT * FROM PENDAFTARAN_BARANG

---3---
CREATE VIEW LIST_MEREK
AS
SELECT MEREK_BARANG
FROM BARANG
WHERE ID_BARANG NOT IN('5');

SELECT * FROM LIST_MEREK

---4---
CREATE VIEW PENJUAL_PEMBELI
AS
SELECT ID_PENJUAL
FROM PENJUAL CROSS JOIN PEMBELI

SELECT * FROM PENJUAL_PEMBELI
---5---
CREATE VIEW PRODUKTERMURAH
AS
SELECT ID_BARANG, HARGA FROM BARANG
WHERE HARGA = (SELECT MIN(HARGA)FROM BARANG);
SELECT * FROM PRODUKTERMURAH

---6---
CREATE VIEW REVIEW_BARANG AS 
SELECT * FROM BARANG
WHERE MEREK_BARANG IN ('NIKE','ADIDAS');
SELECT * FROM REVIEW_BARANG




 ---NOMOR 5 : Function dan Stored Procedure---

---1.FUNCTION MENAMPILKAN DATA DOSEN---
CREATE FUNCTION DATA_PRODUK (PRODUK VARCHAR(20))
RETURNS TABLE 
(ID_BARANG VARCHAR(20),HARGA INT)
LANGUAGE 'plpgsql'
AS
$$
BEGIN
RETURN QUERY
(SELECT BARANG.ID_BARANG, BARANG.HARGA FROM BARANG
WHERE MEREK_BARANG = PRODUK);
END
$$
SELECT * FROM DATA_PRODUK ('ADIDAS');
---2. MENAMPILKAN ID_PEMBELI DAN ALAMAT DARI TABLE PEMBELI---
CREATE FUNCTION UDF_PEMBELI (CUSTOMER VARCHAR(20))
RETURNS TABLE (ID_PEMBELI VARCHAR(20), ALAMAT VARCHAR(20))
LANGUAGE 'plpgsql'
AS
$$
BEGIN
RETURN QUERY
(SELECT PEMBELI.ID_PEMBELI, PEMBELI.ALAMAT FROM PEMBELI
WHERE PEMBELI.USERNAME = CUSTOMER);
END
$$
SELECT * FROM UDF_PEMBELI('SUPRI');




--- STORED PROCEDURE---
---1. MEMASUKKAN DATA BARU KE DATABASE---
CREATE PROCEDURE I_BARANG (I_ID_BARANG VARCHAR(20), I_HARGA INT, I_ID_TRANSAKSI VARCHAR(20), I_JUMLAH_STOK VARCHAR(20), I_MEREK_BARANG CHAR(15), I_ID_DAFTAR VARCHAR(20))
LANGUAGE 'plpgsql'
AS
$$
BEGIN
INSERT INTO BARANG (ID_BARANG, HARGA, ID_TRANSAKSI, JUMLAH_STOK, MEREK_BARANG)
VALUES (I_ID_BARANG, I_HARGA, I_ID_TRANSAKSI, I_JUMLAH_STOK, I_MEREK_BARANG);
COMMIT;
END;
$$

CALL I_BARANG ('07', '90000', '12502', '36' , 'DELL', 'X7');
SELECT * FROM BARANG;

---2. MENGHAPUS MEREK BARANG---
CREATE PROCEDURE DELETE_MEREK_BARANG(I_ID_BARANG VARCHAR(20))
LANGUAGE 'plpgsql'
AS
$$
BEGIN									
DELETE FROM BARANG
WHERE ID_BARANG = I_ID_BARANG;
COMMIT;									
END;
$$

CALL DELETE_MEREK_BARANG ('06');
SELECT * FROM BARANG;

