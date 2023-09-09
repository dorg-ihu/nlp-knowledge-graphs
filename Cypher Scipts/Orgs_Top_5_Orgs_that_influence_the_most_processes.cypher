//Orgs: Top 5 Orgs that influence the most processes
MATCH (o:ORG)
OPTIONAL MATCH (o)<-[:HAS_PARENT*0..]-(child:ORG)<-[:HAS_ORG_OWNER]-(p:PROCESS)
WITH o, COUNT(DISTINCT p) AS InfluencedProcedures
RETURN o.name AS OrganizationName, InfluencedProcedures
ORDER BY InfluencedProcedures DESC
LIMIT 5