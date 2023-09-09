//Conditions: Top 5
MATCH (c:CONDITION)-[:HAS_SEM_SIMILAR_CONDITION*0..1]-(c2:CONDITION)
WITH c2
MATCH (p:PROCESS)-[:HAS_CONDITION]-(c2)
WITH c2, COUNT(p) AS processCount
RETURN c2 AS Condition, processCount AS NumberOfProcesses
ORDER BY processCount DESC
LIMIT 5