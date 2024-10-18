Prometheus url in code space https://friendly-rotary-phone-7w5g6j49r6hwr4p-9090.app.github.dev/graph?g0.expr=&g0.tab=1&g0.display_mode=lines&g0.show_exemplars=0&g0.range_input=1h
Alerts
Graph
Status
Help
Runtime Information
Start time	Fri, 18 Oct 2024 17:36:33 GMT
Working directory	/prometheus
Configuration reload	Successful
Last successful configuration reload	2024-10-18T17:39:17Z
WAL corruptions	0
Goroutines	141
GOMAXPROCS	2
GOMEMLIMIT	9223372036854776000
GOGC	75
GODEBUG	
Storage retention	15d
Build Information
version	2.54.1
revision	e6cfa720fbe6280153fab13090a483dbd40bece3
branch	HEAD
buildUser	root@812ffd741951
buildDate	20240827-10:56:41
goVersion	go1.22.6
Alertmanagers
Endpoint
http://10.244.0.6:9093/api/v2/alerts

When adding to Grafana as a datasource
401 Unauthorized - There was an error returned querying the Prometheus API.

To fix this error:
1. Ensure that the Prometheus server is running and accessible.
2. Verify that the correct URL is used in Grafana's data source configuration.
    - **URL to use:** `http://10.244.0.6:9093`
3. If Prometheus requires authentication, provide the necessary credentials (username and password or API token) in Grafana's data source settings.
4. Check the Prometheus server logs for any authentication-related errors.


Post "http://10.244.0.6:9090/api/v1/query": dial tcp 10.244.0.6:9090: connect: connection refused - There was an error returned querying the Prometheus API.


http://10.244.0.6:9093 404 Not Found - There was an error returned querying the Prometheus API.

