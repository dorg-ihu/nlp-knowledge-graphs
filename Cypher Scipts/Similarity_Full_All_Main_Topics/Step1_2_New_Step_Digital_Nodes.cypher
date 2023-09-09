//Step1: 2. New Step Digital Nodes
MATCH (sd:STEP_DIGITAL)
WITH DISTINCT sd.SIM_D_ID AS sim_d_id, COLLECT(sd.name) AS names
CREATE (t:TempStepDigital {id: sim_d_id, representativeName: names[0]}) 