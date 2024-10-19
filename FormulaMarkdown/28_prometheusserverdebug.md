rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get svc prometheus-server -o yaml
apiVersion: v1
kind: Service
metadata:
  annotations:
    meta.helm.sh/release-name: prometheus
    meta.helm.sh/release-namespace: default
  creationTimestamp: "2024-10-18T18:20:24Z"
  labels:
    app.kubernetes.io/component: server
    app.kubernetes.io/instance: prometheus
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: prometheus
    app.kubernetes.io/part-of: prometheus
    app.kubernetes.io/version: v2.54.1
    helm.sh/chart: prometheus-25.27.0
  name: prometheus-server
  namespace: default
  resourceVersion: "493"
  uid: 6485aa42-133e-459c-be30-2a93539e0185
spec:
  clusterIP: 10.107.155.133
  clusterIPs:
  - 10.107.155.133
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 9090
  selector:
    app.kubernetes.io/component: server
    app.kubernetes.io/instance: prometheus
    app.kubernetes.io/name: prometheus
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 




The output you received (`<a href="/graph">Found</a>`) is a good sign—it means that the Prometheus server is running and responding on `http://localhost:9090`.

Now that you've successfully port-forwarded the service, you should be able to access the Prometheus web interface by navigating to:

```
http://localhost:9090/graph
```

This URL will take you to the Prometheus query interface, where you can run PromQL queries and explore metrics.

### Next Steps:

1. **Access Prometheus in Grafana:**
   - In your Grafana dashboard, configure the Prometheus data source by pointing it to `http://localhost:9090`.
   - You can do this by navigating to **Configuration** > **Data Sources** > **Add data source** > **Prometheus**, and set the URL to `http://localhost:9090`.

2. **Test the Integration:**
   - After adding Prometheus as a data source in Grafana, try creating a new dashboard and adding some panels to visualize the metrics.
   
Let me know if you face any other issues!