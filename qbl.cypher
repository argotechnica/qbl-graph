// Qabalistic Tree of Life Graph Database
//
// This document is written in Cypher Query Language for the Neo4j graph
// database. See: http://neo4j.com/docs/stable/cypher-query-lang.html
//
// TO DO:
//   + Figure out how to define "Paths on the Tree" in a way to support
//     1-10 being the first 10 sephiroth, and the remaining 11-32 being
//     the connections between the 10 sephiroth
//   + Add astrological symbols; consider using UTF:
//     http://unicode-table.com/en/blocks/alchemical-symbols/
//   + Add Hebrew letters; consider using UTF: 
//     http://unicode-table.com/en/blocks/hebrew/
//   + Add Tarot cards

START n = node(*)
OPTIONAL MATCH n-[r]-()
WHERE (ID(n)>0 AND ID(n)<10000)
DELETE n, r

// CREATE THE SEPHIROTH AND PILLARS
// There are traditionally 10 sephiroth, but an 11th unnumbered
// one called "Daath" also exists.
CREATE (Kether:Sephirah { Name:'Kether', SephirahNumber:1 })
CREATE (Chokmah:Sephirah { Name: 'Chokmah', SephirahNumber:2 })
CREATE (Binah:Sephirah { Name: 'Binah', SephirahNumber:3 })
CREATE (Daath:Sephirah { Name: 'Daath' })
CREATE (Chesed:Sephirah { Name: 'Chesed', SephirahNumber:4 })
CREATE (Geburah:Sephirah { Name: 'Geburah', SephirahNumber:5 })
CREATE (Tiphareth:Sephirah { Name: 'Tiphareth', SephirahNumber:6 })
CREATE (Netzach:Sephirah { Name: 'Netzach', SephirahNumber:7 })
CREATE (Hod:Sephirah { Name: 'Hod', SephirahNumber:8 })
CREATE (Yesod:Sephirah { Name: 'Yesod', SephirahNumber:9 })
CREATE (Malkuth:Sephirah { Name: 'Malkuth', SephirahNumber:10 })
// The tree is organized into three "pillars," such that each sephirah
// corresponds to one and only one, and shares qualities with other
// sephirah aligned to that pillar.
CREATE (MiddlePillar:Pillar { Name: 'Middle Millar' })
CREATE (MercyPillar:Pillar { Name: 'Pillar of Mercy' })
CREATE (SeverityPillar:Pillar { Name: 'Pillar of Severity' })

// DEFINE CORRESPONDENCES
CREATE
	// Each sephirah is considered to be "emanated" from the preceding one.
	// Crowley describes the shape created by connecting the lines of these
	// emanations, when connected in order on the traditional tree structure,
	// as "777."
	(Kether)-[:EMANATED]->(Chokmah),
	(Chokmah)-[:EMANATED]->(Binah),
	(Binah)-[:EMANATED]->(Chesed),
	(Chesed)-[:EMANATED]->(Geburah),
	(Geburah)-[:EMANATED]->(Tiphareth),
	(Tiphareth)-[:EMANATED]->(Netzach),
	(Netzach)-[:EMANATED]->(Hod),
	(Hod)-[:EMANATED]->(Yesod),
	(Yesod)-[:EMANATED]->(Malkuth),

	(Kether)-[:IN]->(MiddlePillar),
	(Chokmah)-[:IN]->(MercyPillar),
	(Binah)-[:IN]->(SeverityPillar),
	(Daath)-[:IN]->(MiddlePillar),
	(Chesed)-[:IN]->(MercyPillar),
	(Geburah)-[:IN]->(SeverityPillar),
	(Tiphareth)-[:IN]->(MiddlePillar),
	(Netzach)-[:IN]->(MercyPillar),
	(Hod)-[:IN]->(SeverityPillar),
	(Yesod)-[:IN]->(MiddlePillar),
	(Malkuth)-[:IN]->(MiddlePillar)
