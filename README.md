# Stapfer Enquête as RDF

This repository contains scripts and a dump of the [Stapfer-Enquête](http://stapferenquete.ch/) as RDF. The export is done from the original MySQL database using the [Stardog](http://stardog.com/) RDF database.

## Requirements

The transformation from RDB to RDF is done using the Stardog proprietary [Stardog Mapping Syntax](http://docs.stardog.com/#StardogMapping%20Syntax). It is then materialized using the [Virtual Graph](http://docs.stardog.com/#_materializing_virtual_graphs) feature of Stardog. Note that you need a Stardog Enterprise license to get this to work. 

You also need to install the [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/), put it into the `server/dbms` directory of your Stardog installation. There is also an appropriate config file for MariaDB.

## Files

* `ìnput` - contains a dump of the MySQL DB. Load it to a local MySQL database
* `config` - contains the MySQL driver configuration and the mapping file itself
* `target` - contains the generated export as NTriples.

## Usage

* Start MySQL and import database, adjust `stapfer.property` accordingly
* Start Stardog: `stardog-admin server start`
* Create a database called `stapfer`
* Add virtual graph: `stardog-admin virtual add stapfer-mysql.properties stapfer-sms.ttl`
* Materialize the data to the store: `stardog-admin virtual import stapfer stapfer stapfer-mysql.properties stapfer-sms.ttl` 

To dump it you can use the SPARQL [Graph Store Protocol]():

    curl -G -u admin:admin -H  "Accept: application/n-triples" -o stapfer.nt http://localhost:5820/stapfer

## Querying

The dump was loaded into [LINDAS](http://lindas-data.ch/). You can query it via [SPARQL](http://lindas-data.ch/sparql):

    SELECT * FROM <http://lindas-data.ch/resource/stapferenquete> WHERE {?s ?p ?o} LIMIT 10

The dataset is around 500'000 triples in total.
