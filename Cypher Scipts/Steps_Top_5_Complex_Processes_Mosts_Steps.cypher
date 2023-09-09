//Steps: Top 5 Complex Processes (Mosts Steps)
MATCH (p:PROCESS)-[:HAS_STEP]->(s)
WITH p, COUNT(s) AS TotalSteps
RETURN p.name AS ProcedureName, TotalSteps
ORDER BY TotalSteps DESC
LIMIT 5