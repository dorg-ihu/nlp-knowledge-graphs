// Step5: Delete TempEvidence nodes and relationships
MATCH (t:TempEvidence)
DETACH DELETE t;