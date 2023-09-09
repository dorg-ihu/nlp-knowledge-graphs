//Step1: Create Projection
CALL gds.graph.project(
    'condition_graph',
    ['CONDITION'],
    {
        HAS_SEM_SIMILAR_CONDITION: {
            type: 'HAS_SEM_SIMILAR_CONDITION',
            orientation: 'UNDIRECTED'
        }
    }
)