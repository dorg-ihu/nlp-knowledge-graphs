//Step1: Create Projection
CALL gds.graph.project(
    'evidence_graph',
    ['EVIDENCE'],
    {
        HAS_SEM_SIMILAR_EVIDENCE: {
            type: 'HAS_SEM_SIMILAR_EVIDENCE',
            orientation: 'UNDIRECTED'
        }
    }
)