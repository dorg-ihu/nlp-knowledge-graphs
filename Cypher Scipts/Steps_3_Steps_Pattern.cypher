//Steps: 3 Steps Pattern
MATCH (s1:STEP)-[:HAS_NEXT_STEP]->(s2:STEP)-[:HAS_NEXT_STEP]->(s3:STEP)
OPTIONAL MATCH (s1)-[:HAS_SEM_SIMILAR_STEP]->(similar1:STEP)
OPTIONAL MATCH (s2)-[:HAS_SEM_SIMILAR_STEP]->(similar2:STEP)
OPTIONAL MATCH (s3)-[:HAS_SEM_SIMILAR_STEP]->(similar3:STEP)
WITH 
    s1, COLLECT(DISTINCT COALESCE(similar1, s1)) AS semGroup1,
    s2, COLLECT(DISTINCT COALESCE(similar2, s2)) AS semGroup2,
    s3, COLLECT(DISTINCT COALESCE(similar3, s3)) AS semGroup3
WITH semGroup1, semGroup2, semGroup3, COUNT(*) AS frequency
WHERE frequency > 1
RETURN semGroup1, semGroup2, semGroup3, frequency
ORDER BY frequency DESC