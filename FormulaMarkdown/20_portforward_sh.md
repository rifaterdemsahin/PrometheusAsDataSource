You can create a simple Bash script to run both port-forward commands for Prometheus and Grafana. Here's the script:

```bash
#!/bin/bash

# Port forward Prometheus server
kubectl port-forward svc/prometheus-server 9090:9090 &

# Port forward Grafana
kubectl port-forward svc/grafana 3000:80 &
 
# Wait for both processes to finish
wait
```

### Explanation:
- The `&` at the end of each `kubectl port-forward` command runs the process in the background.
- The `wait` command ensures the script waits for both background processes to run.

To use the script:
1. Save the script to a file, e.g., `forward.sh`.
2. Make it executable by running:

   ```bash
   chmod +x forward.sh
   ```

3. Run the script:

   ```bash
   ./forward.sh
   ```

This will forward Prometheus on port `9090` and Grafana on port `3000` to your local machine.