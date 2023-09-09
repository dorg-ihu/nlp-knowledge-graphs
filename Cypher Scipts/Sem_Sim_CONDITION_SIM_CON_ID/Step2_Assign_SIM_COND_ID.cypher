//Step2: Assign SIM_COND_ID
CALL gds.labelPropagation.write('condition_graph', {
    writeProperty: 'SIM_COND_ID',
    relationshipTypes: ['HAS_SEM_SIMILAR_CONDITION']
})