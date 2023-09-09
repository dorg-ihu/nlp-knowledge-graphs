//Evidences: (Φ. Εν.) -> Which processes
MATCH (e:EVIDENCE)-[:HAS_SEM_SIMILAR_EVIDENCE*0..]-(e2:EVIDENCE)
MATCH (p:PROCESS)-[:HAS_EVIDENCE]-(e2)
WHERE e.name = 'Φορολογική Ενημερότητα'
RETURN p