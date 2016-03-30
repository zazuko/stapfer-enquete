# Stapfer Enquête in RDF

This repository contains scripts and a dump of the [Stapfer-Enquête](http://stapferenquete.ch/) as RDF. The export is done from the original MySQL database using the [Stardog](http://stardog.com/) database.

The configuration is done using the Stardog proprietary [Stardog Mapping Syntax](http://docs.stardog.com/#StardogMapping%20Syntax). It is then materialized using the [Virtual Graph](http://docs.stardog.com/#_materializing_virtual_graphs) feature of Stardog 4.x.

Note that you need a Enterprise license to get this to work. The output is stored as Turtle export in the `target` directory of this repository.
