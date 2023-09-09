//Step2: Assign SIM_ID
CALL gds.labelPropagation.write('step_graph', {
    writeProperty: 'SIM_ID',
    relationshipTypes: ['HAS_SEM_SIMILAR_STEP']
})