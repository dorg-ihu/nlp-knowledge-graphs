// Step5: Delete TempStep nodes and relationships
MATCH (t:TempStep)
DETACH DELETE t;