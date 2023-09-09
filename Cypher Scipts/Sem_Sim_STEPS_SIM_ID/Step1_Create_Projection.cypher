//Step1: Create Projection
CALL gds.graph.project(
    'step_graph',
    ['STEP'],
    {
        HAS_SEM_SIMILAR_STEP: {
            type: 'HAS_SEM_SIMILAR_STEP',
            orientation: 'UNDIRECTED'
        }
    }
)