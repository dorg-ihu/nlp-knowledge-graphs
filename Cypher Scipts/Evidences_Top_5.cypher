//Evidences: Top 5
MATCH (e:EVIDENCE)-[:HAS_SEM_SIMILAR_EVIDENCE]-(e2:EVIDENCE)
WITH e2
MATCH (p:PROCESS)-[:HAS_EVIDENCE]-(e2)
WITH DISTINCT e2.SIM_EV_ID as e2_sim_ev_id, collect(DISTINCT e2)[0] as ev, COUNT(DISTINCT p) AS processCount
RETURN ev.name AS Evidence, processCount AS NumberOfProcesses
ORDER BY processCount DESC
LIMIT 5