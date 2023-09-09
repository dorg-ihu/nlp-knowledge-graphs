//Step2: 2
CALL gds.beta.pipeline.linkPrediction.addNodeProperty('pipe', 'fastRP', {
  mutateProperty: 'embedding',
  embeddingDimension: 256,
  randomSeed: 42, 
  contextNodeLabels: ['STEP', 'STEP_DIGITAL', 'EVIDENCE','CONDITION', 'TOPIC'],
  contextRelationshipTypes: ['HAS_TOPIC', 'HAS_STEP', 'HAS_STEP_DIGITAL', 'HAS_EVIDENCE', 'HAS_CONDITION', 'HAS_SEM_SIMILAR_PROCESS']
})