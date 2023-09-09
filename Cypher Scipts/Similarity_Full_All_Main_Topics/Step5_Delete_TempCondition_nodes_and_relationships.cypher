// Step5: Delete TempCondition nodes and relationships
MATCH (t:TempCondition)
DETACH DELETE t;