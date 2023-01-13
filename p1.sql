SELECT nome,tipo 
FROM Equipa,EquipaParticipa 
WHERE temporadaCampeonato = 2021 
    AND Equipa.nome = EquipaParticipa.nomeEquipa;