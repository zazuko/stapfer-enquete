# Stapfer Enquête as RDF

This repository contains scripts and a dump of the [Stapfer-Enquête](http://stapferenquete.ch/) as RDF. The export is done from the original MySQL database using the [Stardog](http://stardog.com/) RDF database.

## Requirements

The transformation from RDB to RDF is done using the Stardog proprietary [Stardog Mapping Syntax](http://docs.stardog.com/#StardogMapping%20Syntax). It is then materialized using the [Virtual Graph](http://docs.stardog.com/#_materializing_virtual_graphs) feature of Stardog 4.x. Note that you need a Stardog Enterprise license to get this to work. 

You also need to install the [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/), put it into the `server/dbms` directory of your Stardog installation.

## Files

* `ìnput` - contains a dump of the MySQL DB. Load it to a local MySQL database
* `config` - contains the MySQL driver configuration and the mapping file itself
* `target` - contains the generated export as Turtle

## Usage

* Start MySQL and import database, adjust `stapfer.property` accordingly
* Start Stardog: `stardog-admin server start`
* Add virtual graph: `stardog-admin virtual add stapfer.property stapfer-sms.ttl`

For some reason the materialization does not seem to work for us, we thus copied it via SPARQL.

* Create a database in Stardog
* Go to the SPARQL console and execute: `ADD <virtual://stapfer> TO <http://example.com/stapfer>`

This imports all data into the graph defined above. You can now export it as Turtle.

## Querying

The dump was loaded into [LINDAS](http://lindas-data.ch/). You can query it via [SPARQL](http://lindas-data.ch/sparql):

    SELECT * FROM <http://lindas-data.ch/resource/stapferenquete> WHERE {?s ?p ?o} LIMIT 10

The dataset is around 500'000 triples in total.
