// List all appointments with their reasons, dates and the names of the doctors and patients. Sort by date, ascending.
MATCH (p:Patient)<-[:HAS_PATIENT]-(a:Appointment)-[:HAS_DOCTOR]->(d:Doctor)
RETURN a.reason AS reason, date(a.time) AS date, d.firstName + ' ' + d.lastName AS doctorName, p.firstName + ' ' + p.lastName AS patientName
ORDER BY date ASC