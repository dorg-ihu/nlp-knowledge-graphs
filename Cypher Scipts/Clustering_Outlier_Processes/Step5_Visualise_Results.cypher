//Step5: Visualise Results
MATCH (n:PROCESS) -[:HAS_STEP]->(s)
WHERE n.cluster_steps =167	  
RETURN n, s