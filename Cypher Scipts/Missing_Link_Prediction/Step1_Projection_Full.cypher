//Step1: Projection Full
CALL gds.graph.project(
    'process_graph',
    {
        PROCESS: {
            label: 'PROCESS',
            properties: ['cluster_steps']
        },
        STEP: {
            label: 'STEP',
            properties: 'SIM_ID'
        },
        STEP_DIGITAL: {
            label: 'STEP_DIGITAL',
            properties: 'SIM_D_ID'
        },
        EVIDENCE: {
            label: 'EVIDENCE',
            properties: 'SIM_EV_ID'
        },
        CONDITION: {
            label: 'CONDITION',
            properties: 'SIM_COND_ID'
        },
        TOPIC: {
            label: 'TOPIC'
        }
    },
    
    {
        HAS_RELATED: {type: 'HAS_RELATED', orientation: 'UNDIRECTED'},
        HAS_TOPIC: {type: 'HAS_TOPIC', orientation: 'UNDIRECTED'},
        HAS_STEP: {
            type: 'HAS_STEP', 
            orientation: 'UNDIRECTED',
            properties: 'SIM_ID'
        },
        HAS_STEP_DIGITAL: {
            type: 'HAS_STEP_DIGITAL', 
            orientation: 'UNDIRECTED',
            properties: 'SIM_D_ID'
        },
        HAS_EVIDENCE: {
            type: 'HAS_EVIDENCE', 
            orientation: 'UNDIRECTED',
            properties: 'SIM_EV_ID'
        },
          HAS_CONDITION: {
            type: 'HAS_CONDITION', 
            orientation: 'UNDIRECTED',
            properties: 'SIM_COND_ID'
        },
        HAS_SEM_SIMILAR_PROCESS: {type: 'HAS_SEM_SIMILAR_PROCESS', orientation: 'UNDIRECTED'}
    }
)