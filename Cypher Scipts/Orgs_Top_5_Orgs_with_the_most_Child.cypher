//Orgs: Top 5 Orgs with the most Child
MATCH (o:ORG)-[:HAS_PARENT]->(parent:ORG)
WITH parent, COUNT(o) AS childCount
RETURN parent.name AS ParentOrganization, childCount AS NumberOfChildOrgs
ORDER BY childCount DESC
LIMIT 5