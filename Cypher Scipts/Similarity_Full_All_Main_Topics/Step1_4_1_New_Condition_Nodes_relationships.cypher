//Step1: 4.1 New Condition Nodes relationships
MATCH (p:PROCESS)-[:HAS_CONDITION]->(c:CONDITION)
MATCH (t:TempCondition {id: c.SIM_COND_ID})
MERGE (p)-[:HAS_TEMP_CONDITION]->(t)