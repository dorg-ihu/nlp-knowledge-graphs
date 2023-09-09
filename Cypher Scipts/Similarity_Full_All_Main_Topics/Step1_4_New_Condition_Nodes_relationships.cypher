//Step1: 4. New Condition Nodes relationships
MATCH (c:CONDITION)
WITH DISTINCT c.SIM_COND_ID AS sim_cond_id, COLLECT(c.name) AS names
CREATE (t:TempCondition {id: sim_cond_id, representativeName: names[0]})