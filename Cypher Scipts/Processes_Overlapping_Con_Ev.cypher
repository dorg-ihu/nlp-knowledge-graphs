//Processes: Overlapping Con & Ev
MATCH (p1:PROCESS)-[:HAS_CONDITION]->(c1:CONDITION)-[rc:HAS_SEM_SIMILAR_CONDITION]-(c2:CONDITION)<-[:HAS_CONDITION]-(p2:PROCESS)
WHERE ID(p1) < ID(p2)
WITH p1, p2, COUNT(rc) AS NumberOfConditionRels, COLLECT(DISTINCT c1) AS conditions1, COLLECT(DISTINCT c2) AS conditions2
WITH p1, p2, NumberOfConditionRels, SIZE(conditions1 + conditions2)/2 AS NumberOfSharedConditions
WHERE NumberOfConditionRels >= 2

// Finding processes with at least 2 common evidences
MATCH (p1)-[:HAS_EVIDENCE]->(e1:EVIDENCE)-[re:HAS_SEM_SIMILAR_EVIDENCE]-(e2:EVIDENCE)<-[:HAS_EVIDENCE]-(p2)
WITH p1, p2, NumberOfConditionRels, NumberOfSharedConditions, COUNT(re) AS NumberOfEvidenceRels,  COLLECT(DISTINCT e1) AS evidences1, COLLECT(DISTINCT e2) AS evidences2
WITH p1, p2, NumberOfConditionRels, NumberOfSharedConditions, NumberOfEvidenceRels, SIZE(evidences1 + evidences2)/2 AS NumberOfSharedEvidences
WHERE NumberOfEvidenceRels >= 2

RETURN p1.name AS Process1, p2.name AS Process2,
	   NumberOfConditionRels,
	   NumberOfEvidenceRels,
       NumberOfSharedConditions, 
       NumberOfSharedEvidences
ORDER BY NumberOfConditionRels DESC, NumberOfEvidenceRels DESC
LIMIT 10
