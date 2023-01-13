SELECT nome, COUNT(*) 
FROM OrigemCircuito,Circuito 
WHERE OrigemCircuito.nome = Circuito.nomeCircuito 
GROUP BY OrigemCircuito.nome
 HAVING COUNT(*) > 1;