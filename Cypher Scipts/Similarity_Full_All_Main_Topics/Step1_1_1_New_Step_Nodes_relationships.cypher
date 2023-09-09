//Step1: 1.1 New Step Nodes relationships
MATCH (p:PROCESS)-[:HAS_STEP]->(s:STEP)
MATCH (t:TempStep {id: s.SIM_ID})
MERGE (p)-[:HAS_TEMP_STEP]->(t)