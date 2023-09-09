//Step2: 6 Train
CALL gds.beta.pipeline.linkPrediction.train('process_graph', {
  pipeline: 'pipe',
  modelName: 'lp-pipeline-model',
  metrics: ['AUCPR', 'OUT_OF_BAG_ERROR'],
  sourceNodeLabel: 'PROCESS',
  targetNodeLabel: 'PROCESS',
  targetRelationshipType: 'HAS_RELATED',
  randomSeed: 12
}) YIELD modelInfo, modelSelectionStats
RETURN
  modelInfo.bestParameters AS winningModel,
  modelInfo.metrics.AUCPR.train.avg AS avgTrainScore,
  modelInfo.metrics.AUCPR.outerTrain AS outerTrainScore,
  modelInfo.metrics.AUCPR.test AS testScore,
  [cand IN modelSelectionStats.modelCandidates | cand.metrics.AUCPR.validation.avg] AS validationScores