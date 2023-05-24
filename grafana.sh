#!/bin/bash

# Command to run grafana visualization tool 

docker run -d --name grafana  -p 3000:3000 grafana/grafana 