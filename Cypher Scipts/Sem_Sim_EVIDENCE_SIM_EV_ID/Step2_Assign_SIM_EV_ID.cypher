//Step2: Assign SIM_EV_ID
CALL gds.labelPropagation.write('evidence_graph', {
    writeProperty: 'SIM_EV_ID',
    relationshipTypes: ['HAS_SEM_SIMILAR_EVIDENCE']
})