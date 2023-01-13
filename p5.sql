SELECT ROUND(AVG((CURRENT_DATE - dataNasc)/365),2) as mediaIdade, 
       MAX((CURRENT_DATE - dataNasc)/365) as maxIdade,
       MIN((CURRENT_DATE - dataNasc)/365) as minIdade
FROM Piloto;
