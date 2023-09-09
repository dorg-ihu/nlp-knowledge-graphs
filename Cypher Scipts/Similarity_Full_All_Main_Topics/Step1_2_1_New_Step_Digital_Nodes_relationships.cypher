//Step1: 2.1 New Step Digital Nodes relationships
MATCH (p:PROCESS)-[:HAS_STEP_DIGITAL]->(sd:STEP_DIGITAL)
MATCH (t:TempStepDigital {id: sd.SIM_D_ID})
MERGE (p)-[:HAS_TEMP_STEP_DIGITAL]->(t)