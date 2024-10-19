@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/grafana 3000:80 -n monitoring
Unable to listen on port 3000: Listeners failed to create with the following errors: [unable to create listener: Error listen tcp4 127.0.0.1:3000: bind: address already in use unable to create listener: Error listen tcp6 [::1]:3000: bind: address already in use]
error: unable to listen on any of the requested ports: [{3000 3000}]

### Possible Solutions

1. **Check for Existing Processes:**
    Ensure no other processes are using port 3000. You can use the following commands to check and kill any process using the port:
    ```sh
    lsof -i :3000

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ lsof -i :3000
COMMAND    PID      USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
kubectl 101084 codespace    9u  IPv4 1438760      0t0  TCP localhost:3000 (LISTEN)
kubectl 101084 codespace   10u  IPv6 1438764      0t0  TCP localhost:3000 (LISTEN)
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

    kill -9 101084
    ```

2. **Change the Port:**
    Modify the configuration to use a different port if port 3000 is already in use.

3. **Restart the Service:**
    Sometimes, simply restarting the service or your machine can resolve the issue.

4. **Check Firewall Settings:**
    Ensure that your firewall settings are not blocking the port.

5. **Run as Administrator:**
    If you are on Windows, try running your application as an administrator.

6. **Check for IPv6 Conflicts:**
    If you are not using IPv6, you can disable it or ensure that it is not causing conflicts.

### Additional Resources

- [Grafana Documentation](https://grafana.com/docs/)
- [Common Networking Issues](https://example.com/networking-issues)
- [Port Usage in Linux](https://example.com/port-usage-linux)