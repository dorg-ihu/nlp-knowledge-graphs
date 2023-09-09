//Step1: 3.1 New Evidence Nodes relationships
MATCH (p:PROCESS)-[:HAS_EVIDENCE]->(e:EVIDENCE)
MATCH (t:TempEvidence {id: e.SIM_EV_ID})
MERGE (p)-[:HAS_TEMP_EVIDENCE]->(t)