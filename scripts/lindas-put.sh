#!/bin/sh
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/stapferenquete.nt \
     -G https://lindasprd.netrics.ch:8443/lindas \
     --data-urlencode graph=https://linked.opendata.swiss/graph/SFA/stapfer-enquete

