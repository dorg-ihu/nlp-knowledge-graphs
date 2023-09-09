//Evidences: Processes with at least 4 common Evidences
MATCH (p1:PROCESS)-[:HAS_EVIDENCE]->(e1:EVIDENCE)-[r1:HAS_SEM_SIMILAR_EVIDENCE]-(e2:EVIDENCE)<-[:HAS_EVIDENCE]-(p2:PROCESS)
WHERE p1 <> p2 AND ID(p1) < ID(p2)
WITH p1, p2, count(r1) AS NumberOfRels, COLLECT(DISTINCT e1.name) AS evidences1, COLLECT(DISTINCT e2.name) AS evidences2
WITH p1, p2, NumberOfRels, evidences1 + evidences2 AS allEvidences
WHERE NumberOfRels >= 4
RETURN p1.name, p2.name, allEvidences, NumberOfRels,
 SIZE(allEvidences) / 2 AS NumberOfSharedEvidences
ORDER BY NumberOfRels DESC
limit 10