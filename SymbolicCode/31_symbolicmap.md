Live Helper
https://mermaid.live/

```mermaid
graph TD
    subgraph Minikube
        direction TB
        Prometheus[Prometheus]
        Grafana[Grafana]
    end

    Prometheus -->|Port 80| Grafana
    Client[Client 1990] -->|80| Grafana
```
