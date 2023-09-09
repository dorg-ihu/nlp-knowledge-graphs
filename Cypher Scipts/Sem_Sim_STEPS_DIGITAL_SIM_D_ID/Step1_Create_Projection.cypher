//Step1: Create Projection
CALL gds.graph.project(
    'step_digital_graph',
    ['STEP_DIGITAL'],
    {
        HAS_SEM_SIMILAR_STEP_DIGITAL: {
            type: 'HAS_SEM_SIMILAR_STEP_DIGITAL',
            orientation: 'UNDIRECTED'
        }
    }
)