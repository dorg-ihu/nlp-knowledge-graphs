//Evidences - Conditions: Common Keywords & Topics
MATCH (p:PROCESS)-[:HAS_EVIDENCE]->(e:EVIDENCE),
      (p:PROCESS)-[:HAS_CONDITION]->(c:CONDITION)
WHERE NOT e = c
OPTIONAL MATCH (e)-[:HAS_TOPIC]->(t:TOPIC)<-[:HAS_TOPIC]-(c)
OPTIONAL MATCH (e)-[:HAS_KEYWORD]->(k:KEYWORD)<-[:HAS_KEYWORD]-(c)
WITH p, e, c, COLLECT(DISTINCT t) AS shared_topics, COLLECT(k) AS shared_keywords
RETURN p.id AS ProcessName,
       e.name AS EvidenceName,
       c.name AS ConditionName,
       SIZE(shared_topics) AS SharedTopicsCount,
       SIZE(shared_keywords) AS SharedKeywordsCount,
       (SIZE(shared_topics) + SIZE(shared_keywords)) AS TotalSharedEntities
ORDER BY TotalSharedEntities DESC, SharedTopicsCount DESC, SharedKeywordsCount DESC