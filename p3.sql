SELECT Marca.nome AS Marca, OrigemCircuito.nome AS Circuito, OrigemCircuito.pais
FROM Marca, OrigemCircuito 
WHERE Marca.paisOrigem = OrigemCircuito.pais
  ORDER BY OrigemCircuito.pais ASC;