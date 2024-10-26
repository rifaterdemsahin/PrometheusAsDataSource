@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods -n monitoring
NAME                                                READY   STATUS              RESTARTS   AGE
grafana-595cf8c49d-vdvfd                            0/1     ContainerCreating   0          5s
prometheus-alertmanager-0                           0/1     ContainerCreating   0          15s
prometheus-kube-state-metrics-7b97cb57c6-lwglk      0/1     Running             0          16s
prometheus-prometheus-node-exporter-d42t4           1/1     Running             0          16s
prometheus-prometheus-pushgateway-9f8c968d6-4whfb   0/1     Running             0          16s
prometheus-server-7d64c54f54-h6wsk                  0/2     ContainerCreating   0          16s
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods -n monitoring
NAME                                                READY   STATUS              RESTARTS   AGE
grafana-595cf8c49d-vdvfd                            0/1     ContainerCreating   0          34s
prometheus-alertmanager-0                           1/1     Running             0          44s
prometheus-kube-state-metrics-7b97cb57c6-lwglk      1/1     Running             0          45s
prometheus-prometheus-node-exporter-d42t4           1/1     Running             0          45s
prometheus-prometheus-pushgateway-9f8c968d6-4whfb   1/1     Running             0          45s
prometheus-server-7d64c54f54-h6wsk                  1/2     Running             0          45s