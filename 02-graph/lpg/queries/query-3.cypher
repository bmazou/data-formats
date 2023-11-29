// Get the number of appointments per hospital
MATCH (a:Appointment)-[:HAS_DOCTOR]->(:Doctor)-[:RESIDES_IN]->(:Room)-[:LOCATED_IN]->(h:Hospital)
RETURN h.name AS hospitalName, COUNT(a) AS appointmentCount
