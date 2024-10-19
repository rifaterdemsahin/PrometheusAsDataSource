To update your Prometheus configuration so that it scrapes metrics from `localhost:9182/metrics`, you will need to edit the `prometheus.yml` configuration file. Here's how to configure it properly.

### 1. Update `prometheus.yml`

Open your `prometheus.yml` file and add or update a scrape job for the service running on `localhost:9182`.

```yaml
scrape_configs:
  - job_name: 'custom_metrics'
    static_configs:
      - targets: ['localhost:9182']
```

This will instruct Prometheus to scrape metrics from the `/metrics` endpoint exposed by the service on port `9182`.

### 2. Verify Configuration

Once you've made changes to the `prometheus.yml` file, restart Prometheus to apply the new configuration:

```bash
./prometheus --config.file=prometheus.yml
```

You can also use a configuration test if you want to check for any syntax errors:

```bash
./prometheus --config.file=prometheus.yml --web.enable-lifecycle
```

After restarting, Prometheus will start scraping metrics from `http://localhost:9182/metrics` according to the defined scrape interval.

### 3. Verify Targets in Prometheus

To confirm that Prometheus is successfully scraping metrics from your service, visit the Prometheus targets page:

- Navigate to `http://localhost:9090/targets`.

You should see the `custom_metrics` job with the target `localhost:9182` listed and its status as "UP" if Prometheus can successfully reach the `/metrics` endpoint.

### 4. Create Grafana Dashboard

Once Prometheus starts collecting metrics from `localhost:9182`, you can create a custom Grafana dashboard to visualize those metrics:

1. In Grafana, go to **Dashboards** > **Create Dashboard**.
2. Add a new **Panel** and select the Prometheus data source.
3. In the **Query** section, use the metric names that are being scraped from the `/metrics` endpoint at `localhost:9182`. You can find these metric names by querying Prometheus directly via `http://localhost:9090` or by inspecting the `/metrics` endpoint.

Let me know if you need any further help setting up the dashboard or debugging any issues!