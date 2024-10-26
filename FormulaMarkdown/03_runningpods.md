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

🚀 All pods are up and running!