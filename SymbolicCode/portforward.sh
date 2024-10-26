#!/bin/bash

# Port forward Prometheus server
kubectl port-forward svc/prometheus-server 9090:80 -n monitoring &

# Port forward Grafana
kubectl port-forward svc/grafana 3000:80 -n monitoring &
 
# Wait for both processes to finish
wait
