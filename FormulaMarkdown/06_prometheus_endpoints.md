# Prometheus Endpoints

Prometheus provides several HTTP endpoints to interact with the server. Below is a list of commonly used endpoints:

## `/metrics`
- **Description**: Exposes the metrics collected by Prometheus.
- **Usage**: Typically used by Prometheus to scrape metrics from the application.

## `/federate`
- **Description**: Allows for federation, enabling Prometheus servers to scrape metrics from other Prometheus servers.
- **Usage**: Used for scaling and aggregating metrics across multiple Prometheus servers.

## `/targets`
- **Description**: Displays the status of the scrape targets.
- **Usage**: Useful for debugging and verifying which targets are being scraped.

## `/config`
- **Description**: Shows the current configuration of the Prometheus server.
- **Usage**: Useful for verifying the active configuration.

## `/rules`
- **Description**: Displays the current alerting and recording rules.
- **Usage**: Useful for debugging and verifying rules.

## `/alerts`
- **Description**: Shows the current state of the alert manager.
- **Usage**: Useful for monitoring active alerts.

## `/graph`
- **Description**: Provides a graphical interface to query and visualize metrics.
- **Usage**: Useful for ad-hoc queries and visualizations.

## `/status`
- **Description**: Displays various status information about the Prometheus server.
- **Usage**: Useful for monitoring the health and performance of the server.

## `/flags`
- **Description**: Shows the command-line flags that the Prometheus server was started with.
- **Usage**: Useful for verifying startup configurations.

## `/version`
- **Description**: Displays the version information of the Prometheus server.
- **Usage**: Useful for verifying the version of Prometheus in use.

## `/api/v1/*`
- **Description**: Provides access to the Prometheus HTTP API.
- **Usage**: Used for programmatic access to query metrics, manage alerts, and more.

For more detailed information, refer to the [Prometheus documentation](https://prometheus.io/docs/prometheus/latest/querying/api/).