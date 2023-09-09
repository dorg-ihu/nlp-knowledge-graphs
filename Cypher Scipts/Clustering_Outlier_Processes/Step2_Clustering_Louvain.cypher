//Step2: Clustering (Louvain)
CALL gds.louvain.stream('myGraph')
YIELD nodeId, communityId
RETURN gds.util.asNode(nodeId).id AS processId, communityId
ORDER BY communityId, processId