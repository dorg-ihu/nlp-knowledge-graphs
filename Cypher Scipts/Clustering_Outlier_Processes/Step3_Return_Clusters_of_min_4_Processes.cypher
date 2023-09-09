//Step3: Return Clusters of min 4 Processes
CALL gds.louvain.stream('myGraph')
YIELD nodeId, communityId
WITH communityId, COLLECT(gds.util.asNode(nodeId).id) AS processIds
WHERE SIZE(processIds) > 4  // Adjust this number based on your requirements
RETURN communityId, processIds
ORDER BY SIZE(processIds) DESC