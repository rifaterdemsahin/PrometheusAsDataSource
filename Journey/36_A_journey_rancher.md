# Setting Up a Minikube Cluster with Helm, Prometheus, Grafana, and Thanos

## Prerequisites
- 🖥️ Rancher installed
- 🛠️ kubectl installed
- 🎛️ Helm installed

## Steps

### 1. 🚀 Start Rancher
Ensure Rancher is running and accessible.

### 2. 🔍 Verify Helm Installation
Helm should already be installed as per the prerequisites. Verify the installation:
```bash
helm version
```

### Helm Version Output
```bash
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ helm version
version.BuildInfo{Version:"v3.16.1", GitCommit:"5a5449dc42be07001fd5771d56429132984ab3ab", GitTreeState:"clean", GoVersion:"go1.22.7"}
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ ^C
```

### 3. ➕ Add Helm Repositories
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
echo "Helm repositories added successfully!"
```

### 4. 📈 Install Prometheus
```bash
helm install prometheus prometheus-community/prometheus
```

### 5. 📊 Install Grafana
```bash
helm install grafana grafana/grafana
```

### 6. 🌐 Access Grafana
Get the Grafana admin password:
```bash
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
admin is the default username
password : KJXXQeCaprEKz3FHjq7rjosYOiZxfmnZhM4xi90F

Access Grafana at `http://localhost:3000` and log in with `admin` and the retrieved password.

### 7. 🌐 Access Prometheus
Forward the Prometheus port:
```bash
kubectl port-forward svc/prometheus-server 9090:80
```
- **Local Environment:** Access Prometheus at `http://localhost:9090`.

### 8. ➕ Add Prometheus as a Data Source in Grafana
1. Open Grafana in your browser at `http://localhost:3000`.
2. Log in with `admin` and the retrieved password.
3. Go to **Configuration** > **Data Sources**.
4. Click **Add data source**.
5. Select **Prometheus**.
6. Set the URL to `http://localhost:9090`.
7. Click **Save & Test** to verify the connection.

### 9. ✅ Verify Installations
Check the status of the pods:
```bash
kubectl get pods
```
You should see pods for Prometheus and Grafana running.

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

