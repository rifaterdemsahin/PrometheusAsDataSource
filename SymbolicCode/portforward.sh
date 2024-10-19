#!/bin/bash

# Port forward Prometheus server
kubectl port-forward svc/prometheus-server 9090:80 &

# Port forward Grafana
kubectl port-forward svc/grafana 3000:80 &
 
# Wait for both processes to finish
wait
