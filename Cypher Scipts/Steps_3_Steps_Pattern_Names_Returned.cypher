//Steps: 3 Steps Pattern (Names Returned)
MATCH (s1:STEP)-[:HAS_NEXT_STEP]->(s2:STEP)-[:HAS_NEXT_STEP]->(s3:STEP)
OPTIONAL MATCH (s1)-[:HAS_SEM_SIMILAR_STEP]->(similar1:STEP)
OPTIONAL MATCH (s2)-[:HAS_SEM_SIMILAR_STEP]->(similar2:STEP)
OPTIONAL MATCH (s3)-[:HAS_SEM_SIMILAR_STEP]->(similar3:STEP)
WITH 
    s1, COLLECT(DISTINCT COALESCE(similar1, s1)) AS semGroup1,
    s2, COLLECT(DISTINCT COALESCE(similar2, s2)) AS semGroup2,
    s3, COLLECT(DISTINCT COALESCE(similar3, s3)) AS semGroup3
WITH 
    [node IN semGroup1 | node.name] AS namesGroup1, 
    [node IN semGroup2 | node.name] AS namesGroup2, 
    [node IN semGroup3 | node.name] AS namesGroup3, 
    COUNT(*) AS frequency
WHERE frequency > 1
RETURN namesGroup1, namesGroup2, namesGroup3, frequency
ORDER BY frequency DESC
LIMIT 10