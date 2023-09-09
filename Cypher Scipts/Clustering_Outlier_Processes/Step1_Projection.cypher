//Step1: Projection
CALL gds.graph.project.cypher(
    'myGraph',
    'MATCH (p:PROCESS) RETURN id(p) AS id',
    'MATCH (p1:PROCESS)-[:HAS_STEP]->(:STEP)-[:HAS_SEM_SIMILAR_STEP]-(:STEP)<-[:HAS_STEP]-(p2:PROCESS) RETURN id(p1) AS source, id(p2) AS target'
)