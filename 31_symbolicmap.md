Live Helper
https://mermaid.live/

```mermaid
graph TD
    subgraph Minikube
        direction TB
        Prometheus[Prometheus]
        Grafana[Grafana]
    end

    Prometheus -->|Port 9090| Grafana
    Grafana -->|Port 3000| Prometheus
    Client1990[Client 1990] -->|Port 1990| Grafana
```
