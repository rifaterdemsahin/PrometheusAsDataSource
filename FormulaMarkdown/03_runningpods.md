After minikube start in new codespaces enviroment 
```shell
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods
No resources found in default namespace.
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $
```

When the Helm chart is installed:

```shell
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods
NAME                                                 READY   STATUS    RESTARTS   AGE
grafana-865d849549-p7fzc                             1/1     Running   0          17m
prometheus-alertmanager-0                            1/1     Running   0          17m
prometheus-kube-state-metrics-75b5bb4bf8-x8b47       1/1     Running   0          17m
prometheus-prometheus-node-exporter-4dlsj            1/1     Running   0          17m
prometheus-prometheus-pushgateway-84557d6c79-mdwk9   1/1     Running   0          17m
prometheus-server-644d686bc6-p8jwk                   2/2     Running   0          17m
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $
```

Check the pods in the `monitoring` namespace:
DO NOT INSTALL TO DEFAULT!!!!

```shell
kubectl get pods -n monitoring
```
While Installing

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods -n monitoring
NAME                                                READY   STATUS              RESTARTS   AGE
grafana-595cf8c49d-vdvfd                            0/1     ContainerCreating   0          5s
prometheus-alertmanager-0                           0/1     ContainerCreating   0          15s
prometheus-kube-state-metrics-7b97cb57c6-lwglk      0/1     Running             0          16s
prometheus-prometheus-node-exporter-d42t4           1/1     Running             0          16s
prometheus-prometheus-pushgateway-9f8c968d6-4whfb   0/1     Running             0          16s
prometheus-server-7d64c54f54-h6wsk                  0/2     ContainerCreating   0          16s
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 


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

🚀 All pods are up and running!