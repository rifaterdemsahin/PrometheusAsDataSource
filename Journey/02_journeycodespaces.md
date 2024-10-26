# Setting Up a Minikube Cluster with Helm, Prometheus, Grafana, and Thanos

## Prerequisites
- 🖥️ Minikube installed
- 🛠️ kubectl installed
- 🎛️ Helm installed

## Steps

### 1. 🚀 Start Minikube
```bash
minikube start
minikube status
```

### 2. 🔍 Verify Helm Installation
Helm should already be installed as per the prerequisites. Verify the installation:
```bash
helm version
```


### Helm Version Output
```bash
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ helm version
version.BuildInfo{Version:"v3.16.1", GitCommit:"5a5449dc42be07001fd5771d56429132984ab3ab", GitTreeState:"clean", GoVersion:"go1.22.7"}
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ helm list
```


### 3. ➕ Add Helm Repositories
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
echo "Helm repositories added successfully!"
```
Important always use a namespace never use default
kubectl create namespace monitoring

### 4. 📈 Install Prometheus
```bash
helm install prometheus prometheus-community/prometheus -n monitoring
```

### 5. 📊 Install Grafana
```bash
helm install grafana grafana/grafana -n monitoring
```

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods -A
NAMESPACE     NAME                                                 READY   STATUS    RESTARTS      AGE
kube-system   coredns-6f6b679f8f-v8rmh                             1/1     Running   2 (28m ago)   147m
kube-system   etcd-minikube                                        1/1     Running   2 (28m ago)   147m
kube-system   kube-apiserver-minikube                              1/1     Running   2 (28m ago)   147m
kube-system   kube-controller-manager-minikube                     1/1     Running   2 (28m ago)   147m
kube-system   kube-proxy-6lts6                                     1/1     Running   2 (28m ago)   147m
kube-system   kube-scheduler-minikube                              1/1     Running   2 (28m ago)   147m
kube-system   storage-provisioner                                  1/1     Running   4 (28m ago)   147m
monitoring    grafana-fcff55447-7flvv                              0/1     Running   0             6s
monitoring    prometheus-alertmanager-0                            1/1     Running   0             22s
monitoring    prometheus-kube-state-metrics-75b5bb4bf8-6h9js       1/1     Running   0             22s
monitoring    prometheus-prometheus-node-exporter-ftbv5            1/1     Running   0             22s
monitoring    prometheus-prometheus-pushgateway-84557d6c79-4fcc2   1/1     Running   0             22s
monitoring    prometheus-server-644d686bc6-qbfrk                   1/2     Running   0             22s

# Port forward Grafana

# initial Port forward setup 
```bash
kubectl port-forward svc/grafana 3000:80 -n monitoring
```
- **Local Environment:** Access Grafana at `http://localhost:3000`.
- Development ports > accessed over load balancer
- Development ports > accessed over the bridge

- **CodeSpaces Environment:** Access Grafana at `https://friendly-rotary-phone-7w5g6j49r6hwr4p-3000.app.github.dev`.
- Cloud spaces environment > https://fictional-space-fiesta-675v46v6q35vpw-3000.app.github.dev/connections/datasources/edit/ce1ci1ipttkw0e


### 6. 🔄 Port Forward Prometheus
```bash
kubectl port-forward svc/prometheus-server 9090:80 -n monitoring
```
- **Local Environment:** Access Prometheus at `http://localhost:9090`.

- **CodeSpaces Environment:** Access Prometheus at `https://friendly-rotary-phone-7w5g6j49r6hwr4p-9090.app.github.dev/graph?g0.expr=&g0.tab=1&g0.display_mode=lines&g0.show_exemplars=0&g0.range_input=1h`.

- Development ports > accessed over load balancer
- Development ports > accessed over the bridge

### 7. 🌐 Access Grafana
Get the Grafana admin password:
```bash
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```
admin is the default username
password : KJXXQeCaprEKz3FHjq7rjosYOiZxfmnZhM4xi90F

```
Access Grafana at `http://localhost:3000` and log in with `admin` and the retrieved password.

> Use the ports in the tabs in codespaces

### 8. 🌐 Access Prometheus
Forward the Prometheus port:
```bash
kubectl port-forward svc/prometheus-server 9090:80
```
- **Local Environment:** Access Prometheus at `http://localhost:9090`.
- **CodeSpaces Environment:** Access Prometheus at `https://friendly-rotary-phone-7w5g6j49r6hwr4p-9090.app.github.dev/graph?g0.expr=&g0.tab=1&g0.display_mode=lines&g0.show_exemplars=0&g0.range_input=1h`. Check ports with 9090.

### 9. ➕ Add Prometheus as a Data Source in Grafana
1. **Local:** Open Grafana in your browser at `http://localhost:3000`.
    **CodeSpaces:** Open Grafana at `https://friendly-rotary-phone-7w5g6j49r6hwr4p-3000.app.github.dev/?orgId=1`.
2. Log in with `admin` and the retrieved password.
3. Go to **Configuration** > **Data Sources**.
4. Click **Add data source**.
5. Select **Prometheus**.
>>> Not load balancer but clusterIP address for pod to pod networking access
6A. Set the URL to `https://friendly-rotary-phone-7w5g6j49r6hwr4p-9090.app.github.dev`.
6B. Set the URL to `http://clusterip:9090`.
7. Click **Save & Test** to verify the connection.

### 10. ✅ Verify Installations
Check the status of the pods:
```bash
kubectl get pods
kubectl get -n monitoring
```


