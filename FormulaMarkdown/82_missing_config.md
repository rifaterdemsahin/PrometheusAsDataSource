MISSING CONFIG
You should see pods for Prometheus, Grafana, and Thanos running.

### 🔄 Upgrade Instructions
If you encounter an error, upgrade Prometheus:
```bash
helm install prometheus prometheus-community/prometheus -f /workspaces/PrometheusAsDataSource/SymbolicCode/prometheus.yml
```
For upgrade:
```bash
helm upgrade prometheus prometheus-community/prometheus -f /workspaces/PrometheusAsDataSource/SymbolicCode/prometheus.yaml
```
For Grafana upgrade:
```bash
helm upgrade grafana grafana/grafana -f /workspaces/PrometheusAsDataSource/SymbolicCode/grafana.yaml
```
Release "grafana" has been upgraded. Happy Helming!
