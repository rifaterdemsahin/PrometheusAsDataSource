@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get svc -A
NAMESPACE     NAME                                  TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default       kubernetes                            ClusterIP   10.96.0.1       <none>        443/TCP                  7h19m
kube-system   kube-dns                              ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP   7h19m
monitoring    grafana                               ClusterIP   10.96.141.153   <none>        80/TCP                   4h47m
monitoring    prometheus-alertmanager               ClusterIP   10.99.76.139    <none>        9093/TCP                 4h52m
monitoring    prometheus-alertmanager-headless      ClusterIP   None            <none>        9093/TCP                 4h52m
monitoring    prometheus-kube-state-metrics         ClusterIP   10.97.78.169    <none>        8080/TCP                 4h52m
monitoring    prometheus-prometheus-node-exporter   ClusterIP   10.99.32.144    <none>        9100/TCP                 4h52m
monitoring    prometheus-prometheus-pushgateway     ClusterIP   10.110.42.17    <none>        9091/TCP                 4h52m
monitoring    prometheus-server                     ClusterIP   10.108.170.27   <none>        80/TCP                   4h52m

Each Kubernetes service gets a unique ClusterIP assigned by the Kubernetes control plane. This IP is stable for the lifetime of the service but can change if the service is deleted and recreated. The ClusterIP allows the service to be accessed within the cluster.

The reason for different ClusterIPs for each service is to ensure that each service can be uniquely identified and accessed within the cluster. This isolation helps in managing traffic and service discovery within the Kubernetes environment.