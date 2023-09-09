//Conditions: Processes with at least 4 common Conditions
MATCH (p1:PROCESS)-[:HAS_CONDITION]->(c1:CONDITION)-[:HAS_SEM_SIMILAR_CONDITION]-(c2:CONDITION)<-[:HAS_CONDITION]-(p2:PROCESS)
WHERE p1 <> p2 AND ID(p1) < ID(p2)
WITH p1, p2, COLLECT(DISTINCT c1) AS conditions1, COLLECT(DISTINCT c2) AS conditions2
WITH p1, p2, conditions1 + conditions2 AS allConditions
WHERE SIZE(allConditions) / 2 >= 4
RETURN p1, p2, allConditions,
 SIZE(allConditions) / 2 AS NumberOfSharedConditions
ORDER BY NumberOfSharedConditions DESC