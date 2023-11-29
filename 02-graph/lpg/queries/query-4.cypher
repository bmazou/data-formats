// Find all doctors with degree MD that work in Červený Vrcholek
MATCH (d:Doctor)-[:RESIDES_IN]->(:Room)-[:LOCATED_IN]->(:Hospital {name: 'Červený Vrcholek'})
WHERE 'MD' IN d.degree
RETURN d.firstName + ' ' + d.lastName AS doctorName