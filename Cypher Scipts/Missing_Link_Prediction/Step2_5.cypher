//Step2: 5
CALL gds.alpha.pipeline.linkPrediction.addMLP('pipe',
{hiddenLayerSizes: [4, 2], penalty: 1, patience: 2})