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