//Step2: 3
CALL gds.beta.pipeline.linkPrediction.addFeature('pipe', 'hadamard', {
  nodeProperties: ['embedding', 'cluster_steps']
}) YIELD featureSteps