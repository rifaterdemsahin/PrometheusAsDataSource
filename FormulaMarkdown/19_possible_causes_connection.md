It seems that Grafana is running and loading its configurations correctly based on the logs you provided. However, if you're having trouble adding Prometheus as a data source, here are some potential issues and solutions:

1. **Grafana Configuration**: 
    Ensure that Grafana is properly configured to connect to external data sources. Double-check that your `grafana.ini` file or environment variables are configured correctly for networking. When deploying with Helm, you can set these configurations in your `values.yaml` file. For example:

    ```yaml
    grafana:
      grafana.ini:
         server:
            root_url: http://localhost:3000
         datasources:
            prometheus:
              type: prometheus
              url: http://<prometheus-server>:9090
              access: proxy
              isDefault: true
    ```

    Make sure to replace `<prometheus-server>` with the actual address of your Prometheus server.

2. **Prometheus URL**: 
   When adding Prometheus as a data source, make sure you are using the correct URL for Prometheus. It should be something like `http://<prometheus-server>:9090`. You can check the connection by visiting the Prometheus URL in your browser.

3. **Firewall or Network Issues**: 
   If Prometheus and Grafana are hosted on different machines or containers, ensure that there's no firewall or network configuration blocking communication between them. You can use tools like `curl` or `ping` from the Grafana container to ensure it can reach Prometheus.

4. **Logs and Debugging**:
   The log you shared doesn't explicitly show an error related to Prometheus, but checking for errors or connection issues in the Grafana UI (under **Settings > Data Sources > Prometheus**) could provide more insight.

5. **Permissions and Authentication**: 
   If you are using any form of authentication (e.g., Basic Auth or API tokens), ensure that you have configured these correctly in the Grafana data source setup.

Would you mind sharing more specific error messages or symptoms from the Grafana UI when trying to add Prometheus? That might help narrow down the cause further.