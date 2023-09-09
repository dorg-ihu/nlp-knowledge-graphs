//Step2: Similarity
CALL gds.nodeSimilarity.stream('adjusted_process_similarity_graph')
YIELD node1, node2, similarity
WHERE gds.util.asNode(node1):PROCESS AND gds.util.asNode(node2):PROCESS AND node1 < node2
RETURN gds.util.asNode(node1).name AS Process1, gds.util.asNode(node2).name AS Process2, similarity
ORDER BY similarity DESC