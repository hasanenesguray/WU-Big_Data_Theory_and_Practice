// Clear the existing graph (WARNING: This will remove all data in the database)
MATCH (n)
DETACH DELETE n;

// Create the connected graph structure with properties
CREATE (galaxy:Galaxy {name: "Milky Way", type: "Barred Spiral"}),
       (star:Star {name: "Sun", type: "G-Type Main-Sequence", temperature: 5778}),
       (planet1:Planet {name: "Earth", mass: 5.972, classification: "Terrestrial"}),
       (planet2:Planet {name: "Mars", mass: 0.641, classification: "Terrestrial"}),
       (moon1:Moon {name: "Moon", mass: 0.073, classification: "Natural Satellite"}),
       (moon2:Moon {name: "Phobos", mass: 1.0659e-8, classification: "Natural Satellite"}),
       (moon3:Moon {name: "Deimos", mass: 1.4762e-8, classification: "Natural Satellite"}),

       // Establish relationships
       (star)-[:CONTAINED_IN]->(galaxy),
       (planet1)-[:ORBITS]->(star),
       (planet2)-[:ORBITS]->(star),
       (moon1)-[:ORBITS]->(planet1),
       (moon2)-[:ORBITS]->(planet2),
       (moon3)-[:ORBITS]->(planet2),

       // Connect planets and moons to the galaxy
       (planet1)-[:PART_OF]->(galaxy),
       (planet2)-[:PART_OF]->(galaxy),
       (moon1)-[:PART_OF]->(galaxy),
       (moon2)-[:PART_OF]->(galaxy),
       (moon3)-[:PART_OF]->(galaxy);


//Return the whole graph
MATCH (n) RETURN n;