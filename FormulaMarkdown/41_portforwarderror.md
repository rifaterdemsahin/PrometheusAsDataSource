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

