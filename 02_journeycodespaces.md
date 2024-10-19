# Setting Up a Minikube Cluster with Helm, Prometheus, Grafana, and Thanos

## Prerequisites
- 🖥️ Minikube installed
- 🛠️ kubectl installed
- 🎛️ Helm installed

## Steps

### 1. Start Minikube
```bash
minikube start
```

### 2. Install Helm
Helm should already be installed as per the prerequisites. Verify the installation:
```bash
helm version
```

### 3. Add Helm Repositories
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
echo "Helm repositories added successfully!"
```

### 4. Install Prometheus
```bash
helm install prometheus prometheus-community/prometheus
```

### 5. Install Grafana
```bash
helm install grafana grafana/grafana
```

### 6. Install Thanos
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install thanos bitnami/thanos
```

### 7. Access Grafana
Get the Grafana admin password:
```bash
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
Forward the Grafana port:
```bash
kubectl port-forward svc/grafana 3000:80
```
Access Grafana at `http://localhost:3000` and log in with `admin` and the retrieved password.

### 8. Access Prometheus
Forward the Prometheus port:
```bash
kubectl port-forward svc/prometheus-server 9090:80
```
Local Environment >>> Access Prometheus at `http://localhost:9090`.

CodeSpaces Environment >>> 
https://friendly-rotary-phone-7w5g6j49r6hwr4p-9090.app.github.dev/graph?g0.expr=&g0.tab=1&g0.display_mode=lines&g0.show_exemplars=0&g0.range_input=1h
Check ports with 9090

### 9. Add Prometheus as a Data Source in Grafana
1. Local : Open Grafana in your browser at `http://localhost:3000`.
CodeSpaces >>> https://friendly-rotary-phone-7w5g6j49r6hwr4p-3000.app.github.dev/?orgId=1
2. Log in with `admin` and the retrieved password.
3. Go to **Configuration** > **Data Sources**.
4. Click **Add data source**.
5. Select **Prometheus**.
6. Set the URL to `https://friendly-rotary-phone-7w5g6j49r6hwr4p-9090.app.github.dev`.
7. Click **Save & Test** to verify the connection.

### 10. Verify Installations
Check the status of the pods:
```bash
kubectl get pods
```

You should see pods for Prometheus, Grafana, and Thanos running.

Access error upgrade
helm install prometheus prometheus-community/prometheus -f /workspaces/PrometheusAsDataSource/SymbolicCode/prometheus.yml

for upgrade 
helm upgrade prometheus prometheus-community/prometheus -f /workspaces/PrometheusAsDataSource/SymbolicCode/prometheus.yml


for upgrade 
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ helm upgrade grafana grafana/grafana -f /workspaces/PrometheusAsDataSource/SymbolicCode/grafana.yaml
Release "grafana" has been upgraded. Happy Helming!