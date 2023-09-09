//Step2: 7 Prediction without Save
CALL gds.beta.pipeline.linkPrediction.predict.stream('process_graph', {
  modelName: 'lp-pipeline-model',
  relationshipTypes: ['HAS_RELATED'],
  sampleRate: 0.5,
  topK: 1,
  randomJoins: 2,
  maxIterations: 3
})
YIELD node1 AS sourceNodeId, node2 AS targetNodeId, probability
MATCH (s) WHERE id(s) = sourceNodeId
MATCH (t) WHERE id(t) = targetNodeId
RETURN s.name AS sourceProcess, t.name AS targetProcess, probability
ORDER BY probability DESC