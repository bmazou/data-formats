CREATE
    (hos1:Hospital {name: 'Zlatá Nemocnice', address: 'Československé armády 13, 160 00 Praha 6'}),
    (hos2:Hospital {name: 'Červený Vrcholek', address: 'Bubenečská 6, 160 00 Praha 6'}),
    (hos3:Hospital {name: 'Nová Šachta', address: 'Budečská 933, 120 00 Praha 2'})

CREATE 
    (room1:Room {number: 110, floor: 0}),
    (room3:Room {number: 120, floor: 0}),
    (room2:Room {number: 210, floor: 0}),
    (room4:Room {number: 221, floor: 1}),
    (room5:Room {number: 310, floor: 0}),
    (room6:Room {number: 321, floor: 1})

CREATE 
    (mantis:Person:Doctor {firstName: 'Mantis', lastName: 'Toboggan', degree: ['MD']}),
    (lyria:Person:Doctor {firstName: 'Lyria', lastName: "O'Lagalos", degree: ['MD', 'PhD']}),
    (milo:Person:Doctor {firstName: 'Milo', lastName: 'Minderbinder', degree: ['MPH']}),
    (finree:Person:Doctor {firstName: 'Finree', lastName: 'Brock', degree: ['MD', 'MPH']}),
    (mallet:Person:Doctor {firstName: 'Mallet', lastName: 'Bridge', degree: ['MD']})

CREATE
    (caul:Person:Patient {firstName: 'Caul', lastName: 'Shivers', nationalIdNumber: 7248950316}),
    (nicomo:Person:Patient {firstName: 'Nicomo', lastName: 'Cosca', nationalIdNumber: 5082179643}),
    (leo:Person:Patient {firstName: 'Leo', lastName: 'Brock', nationalIdNumber: 1357924680}),
    (felisin:Person:Patient {firstName: 'Felisin', lastName: 'Paran', nationalIdNumber: 2468013579}),
    (heboric:Person:Patient {firstName: 'Heboric', lastName: 'Fener', nationalIdNumber: 3579246801})

CREATE
    (app1:Appointment {reason: 'Eye injury', time: datetime('2023-02-04T10:00:00')}),
    (app2:Appointment {reason: 'Regular checkup regarding liver disease', time: datetime('2023-10-03T14:00:00')}),
    (app3:Appointment {reason: 'Injured leg', time: datetime('2023-03-03T09:00:00')}),
    (app4:Appointment {reason: 'Chronic dehydration', time: datetime('2023-10-05T16:00:00')}),
    (app5:Appointment {reason: 'Severed hand', time: datetime('2023-04-02T15:00:00')})

CREATE
    (app1)-[:HAS_PATIENT]->(caul),
    (app1)-[:HAS_DOCTOR]->(mantis),
    (app2)-[:HAS_PATIENT]->(nicomo),
    (app2)-[:HAS_DOCTOR]->(mantis),
    (app3)-[:HAS_PATIENT]->(leo),
    (app3)-[:HAS_DOCTOR]->(finree),
    (app4)-[:HAS_PATIENT]->(felisin),
    (app4)-[:HAS_DOCTOR]->(lyria),
    (app5)-[:HAS_PATIENT]->(heboric),
    (app5)-[:HAS_DOCTOR]->(mallet)

CREATE 
    (mantis)-[:RESIDES_IN {startDate: date('2023-01-15')}]->(room1),
    (lyria)-[:RESIDES_IN {startDate: date('2023-02-10')}]->(room2),
    (milo)-[:RESIDES_IN {startDate: date('2023-03-05')}]->(room3),
    (finree)-[:RESIDES_IN {startDate: date('2023-04-20')}]->(room4),
    (mallet)-[:RESIDES_IN {startDate: date('2023-05-15')}]->(room5)

CREATE
    (room1)-[:LOCATED_IN]->(hos1),
    (room2)-[:LOCATED_IN]->(hos1),
    (room3)-[:LOCATED_IN]->(hos2),
    (room4)-[:LOCATED_IN]->(hos2),
    (room5)-[:LOCATED_IN]->(hos3),
    (room6)-[:LOCATED_IN]->(hos3)