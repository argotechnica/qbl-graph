# qbl-graph
Graph database model of the Tree of Life according to Hermetic Qabalah

This project is an attempt to map out the correspondences on the Qabalistic Tree of Life according to the Western Hermetic tradition, particularly as described by Israel Regardie, but hopefully (eventually) incorporating multiple systems with attribution of sources.

Why? Because while I don't subscribe to the teachings/philosophy associated with "Hermetic Qabalah" *per se*, I'm deeply fascinated by the history of the domain generally and by the technical construction and function of the Tree of Life, in particular. I'm also interested in knowledge representation and networks generally, so I saw this as a unique way to experiment with techniques for representing complex relationships in a structured knowledge domain.

Regardie's *A Garden of Pomegranates* served as my primary text for spellings, terms, and correspondences. I'm using Chic & Sandra Tabatha Cicero's 1995 3rd edition of the text; the original was written in 1931.

A first attempt was made using Cognitum's Fluent Editor 2014 (http://www.cognitum.eu/semantics/FluentEditor/), but I found the requirement to define the overall structure as an ontology a bit restricting. My current strategy is to use the Neo4j graph database system and its Cypher Query Language.

References:
* https://en.wikipedia.org/wiki/Hermetic_Qabalah
* *A Garden of Pomegranates: Skrying on the Tree of Life* (978-1567181418)
