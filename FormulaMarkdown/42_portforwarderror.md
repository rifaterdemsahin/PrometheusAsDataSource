$ kubectl port-forward svc/prometheus-server 9090:9090

```markdown
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/prometheus-server 9090:9090
error: Service prometheus-server does not have a service port 9090
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ ^C
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $

GitHub Copilot
used /explain (rerun without)
To debug and fix the issue with the `kubectl port-forward` command, follow these steps:

### Check the Service Definition
Ensure that the `prometheus-server` service is defined correctly and has a port `9090`. You can inspect the service definition using:

```sh
kubectl get svc prometheus-server -o yaml
```

ifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get svc prometheus-server -o yaml
apiVersion: v1
kind: Service
metadata:
  annotations:
    meta.helm.sh/release-name: prometheus
    meta.helm.sh/release-namespace: default
  creationTimestamp: "2024-10-19T10:35:51Z"
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
  resourceVersion: "578"
  uid: 8d0bb631-4259-4b53-8f20-560d87d22226
spec:
  clusterIP: 10.102.249.221
  clusterIPs:
  - 10.102.249.221
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


Look for the `ports` section in the output. It should include an entry with `port: 9090`.

### Verify the Service Ports
If the service does not have port `9090`, you need to either:

1. **Update the Service Definition**: Modify the service to include port `9090`.
2. **Use the Correct Port**: If the service uses a different port, use that port in your `kubectl port-forward` command.

### Update the Service (if needed)
If you need to add port `9090` to the service, you can edit the service definition:

```sh
kubectl edit svc prometheus-server
```

Add the following under the `ports` section if it is missing:

```yaml
ports:
    - port: 9090
        targetPort: 9090
```

### Retry the Port-Forward Command
Once the service is correctly configured, retry the port-forward command:

```sh
kubectl port-forward svc/prometheus-server 9090:9090
```

### Example Service Definition
Here is an example of what the service definition might look like:

```yaml
apiVersion: v1
kind: Service
metadata:
    name: prometheus-server
spec:
    ports:
        - port: 9090
            targetPort: 9090
    selector:
        app: prometheus
```

### Summary
- Inspect the service definition to ensure it includes port `9090`.
- Edit the service if necessary to add the required port.
- Retry the port-forward command after making the necessary changes.

By following these steps, you should be able to resolve the error and successfully forward the port.
```

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods
NAME                                                 READY   STATUS    RESTARTS      AGE
grafana-656b48bc49-g45r7                             1/1     Running   1 (19m ago)   133m
prometheus-alertmanager-0                            1/1     Running   2 (18m ago)   133m
prometheus-kube-state-metrics-75b5bb4bf8-g22gc       1/1     Running   3 (18m ago)   133m
prometheus-prometheus-node-exporter-m77f8            1/1     Running   2 (18m ago)   133m
prometheus-prometheus-pushgateway-84557d6c79-cjtp2   1/1     Running   2 (18m ago)   133m
prometheus-server-644d686bc6-bt65g                   2/2     Running   4 (18m ago)   133m