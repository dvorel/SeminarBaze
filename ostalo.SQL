CREATE PROCEDURE ISPIS_DETALJA_NARUDZBE 
@ID_KUPCA CHAR(6) 
AS 
SELECT 
  N.ID_NAR AS 'Sifra narudzbe', 
  K.IME_KUPAC AS 'Ime Kupca',
  K.PREZIME_KUPAC AS 'Prezime Kupca', 
  K.ADRESA AS 'Adresa', 
  O.VRSTA_OPR AS 'Naziv opreme', 
  (O.CIJENA * 1.25) AS 'Cijena s PDV-om'
FROM KUPAC K, NARUDZBA N, OPREMA O, DETALJI_NARUDZBE DET
WHERE K.ID_KUPCA = @ID_KUPCA AND  
  K.ID_KUPCA = @ID_KUPCA AND  
  N.ID_NAR = DET.ID_NARUDZBE AND    
  DET.ID_OPREME = O.ID_OPR;

CREATE VIEW DJELATNICI 
AS 
SELECT
  D.IME_DJELATNIK + ' ' + D.PREZ_DJELATNIK AS 'Djelatnik', 
  D.ID_DJELATNIK, CONVERT(VARCHAR, D.PLACA) + ' kn' AS Placa, 
  CONVERT(CHAR(2), DATEPART(DAY, D.DAT_ZAPOSLENJA)) + '.'  
  + CONVERT(CHAR(2), DATEPART(MONTH, D.DAT_ZAPOSLENJA)) + '.' 
  + CONVERT(CHAR(4), DATEPART(YEAR, D.DAT_ZAPOSLENJA)) + '.' 
  AS 'Datum zaposlenja'
FROM DJELATNIK AS D;


CREATE PROCEDURE ISPOSTAVA_NARUDZBE
@ID_NARUDZBE CHAR(6) 
AS 
UPDATE NARUDZBA SET DAT_ISP = GETDATE() 
WHERE ID_NAR = @ID_NARUDZBE AND    
DAT_ISP IS NULL; 
