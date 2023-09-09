//Step3: Similarity Full - NOT SEM SIM
CALL gds.nodeSimilarity.stream('full_process_similarity_graph', {similarityCutoff:0.8})
YIELD node1, node2, similarity
WHERE gds.util.asNode(node1):PROCESS AND gds.util.asNode(node2):PROCESS AND node1 < node2
WITH gds.util.asNode(node1) AS p1, gds.util.asNode(node2) AS p2, round(similarity,3) as similarity
WHERE NOT EXISTS((p1)-[:HAS_SEM_SIMILAR_PROCESS]-(p2))
MATCH (p1)-[:HAS_STEP|HAS_CONDITION|HAS_EVIDENCE]->(e1)-[r1:HAS_SEM_SIMILAR_STEP|HAS_SEM_SIMILAR_CONDITION|HAS_SEM_SIMILAR_EVIDENCE]-(e2)<-[:HAS_STEP|HAS_CONDITION|HAS_EVIDENCE]-(p2)
RETURN p1.name AS Process1, p2.name AS Process2, COUNT(r1) as NumberOfRels, similarity
ORDER BY NumberOfRels DESC, similarity DESC