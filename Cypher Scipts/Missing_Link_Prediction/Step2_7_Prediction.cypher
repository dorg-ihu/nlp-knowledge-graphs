//Step2: 7 Prediction
CALL gds.beta.pipeline.linkPrediction.predict.mutate('process_graph', {
  modelName: 'lp-pipeline-model',
  relationshipTypes: ['HAS_RELATED'],
  mutateRelationshipType: 'HAS_RELATED_APPROX_PREDICTED',
  sampleRate: 0.5,
  topK: 1,
  randomJoins: 2,
  maxIterations: 3,
  // necessary for deterministic results
  concurrency: 1,
  randomSeed: 42
})
 YIELD relationshipsWritten, samplingStats