@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ helm install prometheus prometheus-community/prometheus -n monitoring
Error: INSTALLATION FAILED: create: failed to create: namespaces "monitoring" not found
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ ^C
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 


To resolve this issue, you need to create the `monitoring` namespace. You can do this by running the following command:

```sh
kubectl create namespace monitoring
```

After creating the namespace, you can proceed with your installation.