//Step2: Projection Full
CALL gds.graph.project(
    'full_process_similarity_graph',
    {
        PROCESS: {
            label: 'PROCESS',
            properties: 'cluster_steps'
        },
        TempStep: {
            label: 'TempStep',
            properties: 'id'
        },
        TempStepDigital: {
            label: 'TempStepDigital',
            properties: 'id'
        },
        TempEvidence: {
            label: 'TempEvidence',
            properties: 'id'
        },
        TempCondition: {
            label: 'TempCondition',
            properties: 'id'
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
        HAS_TEMP_STEP: {
            type: 'HAS_TEMP_STEP',
            orientation: 'UNDIRECTED'
        },
        HAS_TEMP_STEP_DIGITAL: {
            type: 'HAS_TEMP_STEP_DIGITAL',
            orientation: 'UNDIRECTED'
        },
        HAS_TEMP_EVIDENCE: {
            type: 'HAS_TEMP_EVIDENCE',
            orientation: 'UNDIRECTED'
        },
        HAS_TEMP_CONDITION: {
            type: 'HAS_TEMP_CONDITION',
            orientation: 'UNDIRECTED'
        },
        HAS_SEM_SIMILAR_PROCESS: {type: 'HAS_SEM_SIMILAR_PROCESS', orientation: 'UNDIRECTED'}
    }
)