//Steps: Most Commonly Followed
MATCH (s:STEP)-[:HAS_NEXT_STEP]->(s2:STEP)
WITH  s.SIM_ID AS StepID, s.name AS StepName, s2.SIM_ID AS NextStepID, s2.name AS NextStepName, COUNT(s2) AS CommonFollowers
RETURN  StepID, StepName, NextStepID, NextStepName, CommonFollowers
ORDER BY CommonFollowers DESC
LIMIT 5