//Step3: Visualise
CALL gds.nodeSimilarity.stream('full_process_similarity_graph')
YIELD node1, node2, similarity
WHERE gds.util.asNode(node1):PROCESS AND gds.util.asNode(node2):PROCESS AND node1 < node2
WITH gds.util.asNode(node1) AS Process1, gds.util.asNode(node2) AS Process2, similarity
WHERE similarity > 0.85  // Optional: Display only those with a similarity score above 0.85
CALL apoc.create.vRelationship(Process1, 'SIMILAR_TO', {score: similarity}, Process2) YIELD rel
RETURN Process1, rel, Process2
LIMIT 10