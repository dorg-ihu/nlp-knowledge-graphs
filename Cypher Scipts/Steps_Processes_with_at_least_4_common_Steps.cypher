//Steps: Processes with at least 4 common Steps
MATCH (p1:PROCESS)-[:HAS_STEP]->(s1:STEP)-[:HAS_SEM_SIMILAR_STEP]-(s2:STEP)<-[:HAS_STEP]-(p2:PROCESS)
WHERE p1 <> p2 AND ID(p1) < ID(p2)
WITH p1, p2, COLLECT(DISTINCT s1) AS steps1, COLLECT(DISTINCT s2) AS steps2
WITH p1, p2, steps1 + steps2 AS allSteps
WHERE SIZE(allSteps) / 2 >= 4
RETURN p1, p2, allSteps, SIZE(allSteps) / 2 AS NumberOfSharedSteps
ORDER BY NumberOfSharedSteps DESC