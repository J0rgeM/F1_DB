SELECT nome , valorTransf AS montante                                                              
FROM Piloto, Transferencias                                                                                 
WHERE valorTransf IN (
    SELECT valorTransf
    FROM Transferencias 
    WHERE valorTransf > 15000000
    AND Piloto.nPiloto = Transferencias.nPiloto);