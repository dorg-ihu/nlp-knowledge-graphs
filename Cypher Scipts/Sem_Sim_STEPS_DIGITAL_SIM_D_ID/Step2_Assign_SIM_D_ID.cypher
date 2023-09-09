//Step2: Assign SIM_D_ID
CALL gds.labelPropagation.write('step_digital_graph', {
    writeProperty: 'SIM_D_ID',
    relationshipTypes: ['HAS_SEM_SIMILAR_STEP_DIGITAL']
})