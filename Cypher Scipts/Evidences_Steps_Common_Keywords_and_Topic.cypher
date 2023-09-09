//Evidences - Steps: Common Keywords and Topic
MATCH (p:PROCESS)-[:HAS_EVIDENCE]->(e:EVIDENCE),
      (p:PROCESS)-[:HAS_STEP]->(s:STEP)
WHERE NOT e = s
OPTIONAL MATCH (e)-[:HAS_TOPIC]->(t:TOPIC)<-[:HAS_TOPIC]-(s)
OPTIONAL MATCH (e)-[:HAS_KEYWORD]->(k:KEYWORD)<-[:HAS_KEYWORD]-(s)
WITH p, e, s, COLLECT(DISTINCT t) AS shared_topics, COLLECT(DISTINCT k) AS shared_keywords
RETURN p.id AS ProcessId,
       e.name AS EvidenceName,
       s.name AS StepName,
       SIZE(shared_topics) AS SharedTopicsCount,
       SIZE(shared_keywords) AS SharedKeywordsCount,
       (SIZE(shared_topics) + SIZE(shared_keywords)) AS TotalSharedEntities
ORDER BY TotalSharedEntities DESC, SharedTopicsCount DESC, SharedKeywordsCount DESC