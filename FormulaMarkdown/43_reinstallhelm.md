### Uninstalls

kubectl delete namespace monitoring

```bash
helm uninstall prometheus -n monitoring


helm uninstall grafana -n monitoring
```

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
kube-system   coredns-6f6b679f8f-v8rmh           1/1     Running   2 (25m ago)   144m
kube-system   etcd-minikube                      1/1     Running   2 (25m ago)   144m
kube-system   kube-apiserver-minikube            1/1     Running   2 (25m ago)   144m
kube-system   kube-controller-manager-minikube   1/1     Running   2 (25m ago)   144m
kube-system   kube-proxy-6lts6                   1/1     Running   2 (25m ago)   144m
kube-system   kube-scheduler-minikube            1/1     Running   2 (25m ago)   144m
kube-system   storage-provisioner                1/1     Running   4 (25m ago)   144m
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 