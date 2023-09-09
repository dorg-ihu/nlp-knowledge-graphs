// Step5: Delete TempStepDigital nodes and relationships
MATCH (t:TempStepDigital)
DETACH DELETE t;