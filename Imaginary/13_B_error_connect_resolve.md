@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource/Imaginary (main) $ kubectl get svc -A
NAMESPACE     NAME                                  TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default       kubernetes                            ClusterIP   10.96.0.1       <none>        443/TCP                  148m
kube-system   kube-dns                              ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP   148m
monitoring    grafana                               ClusterIP   10.103.51.13    <none>        80/TCP                   140m
monitoring    prometheus-alertmanager               ClusterIP   10.109.43.208   <none>        9093/TCP                 140m
monitoring    prometheus-alertmanager-headless      ClusterIP   None            <none>        9093/TCP                 140m
monitoring    prometheus-kube-state-metrics         ClusterIP   10.99.126.76    <none>        8080/TCP                 140m
monitoring    prometheus-prometheus-node-exporter   ClusterIP   10.99.208.169   <none>        9100/TCP                 140m
monitoring    prometheus-prometheus-pushgateway     ClusterIP   10.97.94.22     <none>        9091/TCP                 140m
monitoring    prometheus-server                     ClusterIP   10.101.112.72   <none>        80/TCP                   140m
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource/Imaginary (main) $ 