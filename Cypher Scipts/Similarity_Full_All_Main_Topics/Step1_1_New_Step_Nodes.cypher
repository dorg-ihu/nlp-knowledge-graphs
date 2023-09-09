//Step1: 1. New Step Nodes
MATCH (s:STEP)
WITH DISTINCT s.SIM_ID AS sim_id, COLLECT(s.name) AS names
CREATE (t:TempStep {id: sim_id, representativeName: names[0]}) 