//Evidences: Processes without Ev
MATCH (p:PROCESS)
WHERE NOT (p)-[:HAS_EVIDENCE]->(:EVIDENCE)
RETURN p.name AS ProcedureName