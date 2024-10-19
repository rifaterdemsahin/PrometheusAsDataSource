
🔍 **Debugging Process**

minikube start => see 5 ports open up

1. 🛠️ **Check Pods**: 
    ```bash
    kubectl get pod -A
    ```
    See the pods running.

2. 🛠️ **Check Services**: 
    ```bash
    kubectl get svc -A
    ```
    See the services running.

3. 🔄 **Run Port Forwardings**: 
    Open 2 terminals and run the port forwardings.v

    kubectl port-forward svc/prometheus-server 9090:80 -n monitoring
    kubectl port-forward svc/grafana 3000:80 -n monitoring

4. 🌐 **Open Endpoints**: 
    Access the endpoints from the forwarded ports.


    LOGS
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pod -A
NAMESPACE     NAME                                                 READY   STATUS    RESTARTS        AGE
kube-system   coredns-6f6b679f8f-v8rmh                             1/1     Running   3 (6m1s ago)    7h18m
kube-system   etcd-minikube                                        1/1     Running   3 (6m1s ago)    7h19m
kube-system   kube-apiserver-minikube                              1/1     Running   3 (6m1s ago)    7h19m
kube-system   kube-controller-manager-minikube                     1/1     Running   3 (6m1s ago)    7h19m
kube-system   kube-proxy-6lts6                                     1/1     Running   3 (6m1s ago)    7h18m
kube-system   kube-scheduler-minikube                              1/1     Running   3 (6m1s ago)    7h19m
kube-system   storage-provisioner                                  1/1     Running   6 (4m48s ago)   7h19m
monitoring    grafana-8b569b974-f9pwk                              1/1     Running   1 (6m1s ago)    4h47m
monitoring    prometheus-alertmanager-0                            1/1     Running   1 (6m1s ago)    4h51m
monitoring    prometheus-kube-state-metrics-75b5bb4bf8-6h9js       1/1     Running   1 (6m1s ago)    4h51m
monitoring    prometheus-prometheus-node-exporter-ftbv5            1/1     Running   1 (6m1s ago)    4h51m
monitoring    prometheus-prometheus-pushgateway-84557d6c79-4fcc2   1/1     Running   1 (6m1s ago)    4h51m
monitoring    prometheus-server-644d686bc6-qbfrk                   2/2     Running   2 (6m1s ago)    4h51m
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 


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


kubectl port-forward svc/prometheus-server 9090:80 -n monitoring
kubectl port-forward svc/grafana 3000:80 -n monitoring


