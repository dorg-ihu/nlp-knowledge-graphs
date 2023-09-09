//Step1: 3. New Evidence Nodes 
MATCH (e:EVIDENCE)
WITH DISTINCT e.SIM_EV_ID AS sim_ev_id, COLLECT(e.name) AS names
CREATE (t:TempEvidence {id: sim_ev_id, representativeName: names[0]})