@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

kubectl get svc prometheus-server -o yaml -n monitoring
apiVersion: v1
kind: Service
metadata:
  annotations:
    meta.helm.sh/release-name: prometheus
    meta.helm.sh/release-namespace: monitoring
  creationTimestamp: "2024-10-26T09:09:11Z"
  labels:
    app.kubernetes.io/component: server
    app.kubernetes.io/instance: prometheus
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: prometheus
    app.kubernetes.io/part-of: prometheus
    app.kubernetes.io/version: v2.55.0
    helm.sh/chart: prometheus-25.28.0
  name: prometheus-server
  namespace: monitoring
  resourceVersion: "776"
  uid: 9202c086-041c-47b2-a097-407c782328ba
spec:
  clusterIP: 10.101.112.72
  clusterIPs:
  - 10.101.112.72
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