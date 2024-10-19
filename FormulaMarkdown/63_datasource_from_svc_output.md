In your Minikube environment, to set up Prometheus as a data source for Grafana, you need to provide Grafana with the Prometheus endpoint. Based on your `kubectl get svc` output, the service you want is `prometheus-server`, which is running on ClusterIP `10.108.170.27` on port `80`.

### Steps to add Prometheus as a data source in Grafana:

1. **Access Grafana UI**: 
   - Forward the Grafana service port to your local machine:
     ```bash
     kubectl port-forward svc/grafana -n monitoring 3000:80
     ```
   - Then open `http://localhost:3000` in your browser.

2. **Login to Grafana**: 
   - The default login for Grafana is usually `admin` for both username and password (or you might have set custom credentials).

3. **Add Prometheus as a Data Source**:
   - Go to **Configuration** -> **Data Sources** -> **Add data source**.
   - Choose **Prometheus** as the type.
   - In the **URL** field, input the following:
     ```
     http://10.108.170.27:80
     ```
   - Leave the rest as default and click **Save & Test**.

This should successfully add Prometheus as a data source to your Grafana instance in your Minikube environment.

kubectl get svc -A
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get svc -A
NAMESPACE     NAME                                  TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default       kubernetes                            ClusterIP   10.96.0.1       <none>        443/TCP                  7h19m
kube-system   kube-dns                              ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP   7h19m
monitoring    grafana                               ClusterIP   10.96.141.153   <none>        80/TCP                   4h47m
monitoring    prometheus-alertmanager               ClusterIP   10.99.76.139    <none>        9093/TCP                 4h52m
monitoring    prometheus-alertmanager-headless      ClusterIP   None            <none>        9093/TCP                 4h52m
monitoring    prometheus-kube-state-metrics         ClusterIP   10.97.78.169    <none>        8080/TCP                 4h52m
monitoring    prometheus-prometheus-node-exporter   ClusterIP   10.99.32.144    <none>        9100/TCP                 4h52m
monitoring    prometheus-prometheus-pushgateway     ClusterIP   10.110.42.17    <none>        9091/TCP                 4h52m
monitoring    prometheus-server                     ClusterIP   10.108.170.27   <none>        80/TCP                   4h52m