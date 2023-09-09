//Step2: 4
CALL gds.beta.pipeline.linkPrediction.configureSplit('pipe', {
  testFraction: 0.25,
  trainFraction: 0.6,
  validationFolds: 3
})
YIELD splitConfig