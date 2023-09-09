//Conditions: Processes with the Most Conditions
MATCH (p:PROCESS)-[:HAS_CONDITION]->(c:CONDITION)
WITH p, COUNT(c) AS conditionCount
RETURN p.name AS ProcedureName, conditionCount AS NumberOfConditions
ORDER BY conditionCount DESC
LIMIT 5