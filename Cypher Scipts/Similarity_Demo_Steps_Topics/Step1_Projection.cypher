//Step1: Projection
CALL gds.graph.project(
    'adjusted_process_similarity_graph',
    {
        PROCESS: {
            label: 'PROCESS',
            properties: 'cluster_steps'
        },
        STEP: {
            label: 'STEP',
            properties: 'SIM_ID'
        },
        TOPIC: {
            label: 'TOPIC'
        },
        KEYWORD: {
            label: 'KEYWORD'
        },
        ORG: {
            label: 'ORG'
        }
    },
    
    {
        HAS_RELATED: {type: 'HAS_RELATED', orientation: 'UNDIRECTED'},
        HAS_KEYWORD: {type: 'HAS_KEYWORD', orientation: 'UNDIRECTED'},
        HAS_TOPIC: {type: 'HAS_TOPIC', orientation: 'UNDIRECTED'},
        HAS_ORG_OWNER: {type: 'HAS_ORG_OWNER', orientation: 'UNDIRECTED'},
        HAS_STEP: {
            type: 'HAS_STEP', 
            orientation: 'UNDIRECTED',
            properties: 'SIM_ID'
        },
        HAS_SEM_SIMILAR_PROCESS: {type: 'HAS_SEM_SIMILAR_PROCESS', orientation: 'UNDIRECTED'}
    }
)