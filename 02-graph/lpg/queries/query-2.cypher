// Get all hospitals, their addresses and how many doctors they have
MATCH (d:Doctor)-[:RESIDES_IN]->(:Room)-[:LOCATED_IN]->(h:Hospital)
RETURN h.name as hospitalName, h.address AS hospitalAddress, count(d) AS numberOfDoctors