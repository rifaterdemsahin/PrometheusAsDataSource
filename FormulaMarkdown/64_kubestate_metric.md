@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get pod -A
NAMESPACE     NAME                                                 READY   STATUS    RESTARTS      AGE
kube-system   coredns-6f6b679f8f-v8rmh                             1/1     Running   3 (26m ago)   7h39m
kube-system   etcd-minikube                                        1/1     Running   3 (26m ago)   7h39m
kube-system   kube-apiserver-minikube                              1/1     Running   3 (26m ago)   7h39m
kube-system   kube-controller-manager-minikube                     1/1     Running   3 (26m ago)   7h39m
kube-system   kube-proxy-6lts6                                     1/1     Running   3 (26m ago)   7h39m
kube-system   kube-scheduler-minikube                              1/1     Running   3 (26m ago)   7h39m
kube-system   storage-provisioner                                  1/1     Running   6 (25m ago)   7h39m
monitoring    grafana-8b569b974-f9pwk                              1/1     Running   1 (26m ago)   5h7m
monitoring    prometheus-alertmanager-0                            1/1     Running   1 (26m ago)   5h12m
monitoring    prometheus-kube-state-metrics-75b5bb4bf8-6h9js       1/1     Running   1 (26m ago)   5h12m
monitoring    prometheus-prometheus-node-exporter-ftbv5            1/1     Running   1 (26m ago)   5h12m
monitoring    prometheus-prometheus-pushgateway-84557d6c79-4fcc2   1/1     Running   1 (26m ago)   5h12m
monitoring    prometheus-server-644d686bc6-qbfrk                   2/2     Running   2 (26m ago)   5h12m
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

To get `kube-state-metrics` in your setup, you need to ensure that the `kube-state-metrics` service is correctly installed and running within your cluster. From your provided output, it looks like the `prometheus-kube-state-metrics` pod is running in the `monitoring` namespace.

If you want to query and monitor the Kubernetes state via `kube-state-metrics`, follow these steps:

### 1. Check the Logs of `kube-state-metrics`
You can check the logs of the `kube-state-metrics` pod to ensure that it is working as expected:

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl logs prometheus-kube-state-metrics-75b5bb4bf8-6h9js -n monitoring
I1019 17:45:53.970470       1 wrapper.go:120] "Starting kube-state-metrics"
W1019 17:45:53.977657       1 client_config.go:659] Neither --kubeconfig nor --master was specified.  Using the inClusterConfig.  This might not work.
I1019 17:45:53.978335       1 server.go:218] "Used resources" resources=["pods","networkpolicies","services","certificatesigningrequests","deployments","leases","resourcequotas","volumeattachments","cronjobs","endpoints","storageclasses","persistentvolumeclaims","replicationcontrollers","namespaces","secrets","statefulsets","configmaps","ingresses","validatingwebhookconfigurations","limitranges","poddisruptionbudgets","replicasets","horizontalpodautoscalers","persistentvolumes","mutatingwebhookconfigurations","nodes","daemonsets","jobs"]
I1019 17:45:53.978386       1 types.go:227] "Using all namespaces"
I1019 17:45:53.978400       1 types.go:145] "Using node type is nil"
I1019 17:45:53.978419       1 server.go:245] "Metric allow-denylisting" allowDenyStatus="Excluding the following lists that were on denylist: "
W1019 17:45:53.978442       1 client_config.go:659] Neither --kubeconfig nor --master was specified.  Using the inClusterConfig.  This might not work.
I1019 17:45:54.020118       1 utils.go:72] "Tested communication with server"
I1019 17:45:54.033261       1 utils.go:77] "Run with Kubernetes cluster version" major="1" minor="31" gitVersion="v1.31.0" gitTreeState="clean" gitCommit="9edcffcde5595e8a5b1a35f88c421764e575afce" platform="linux/amd64"
I1019 17:45:54.033491       1 utils.go:78] "Communication with server successful"
I1019 17:45:54.034698       1 server.go:372] "Started metrics server" metricsServerAddress="[::]:8080"
I1019 17:45:54.035216       1 server.go:78] levelinfomsgListening onaddress[::]:8080
I1019 17:45:54.035319       1 server.go:78] levelinfomsgTLS is disabled.http2falseaddress[::]:8080
I1019 17:45:54.035415       1 metrics_handler.go:99] "Autosharding disabled"
I1019 17:45:54.039407       1 server.go:361] "Started kube-state-metrics self metrics server" telemetryAddress="[::]:8081"
I1019 17:45:54.039739       1 server.go:78] levelinfomsgListening onaddress[::]:8081
I1019 17:45:54.039811       1 server.go:78] levelinfomsgTLS is disabled.http2falseaddress[::]:8081
I1019 17:45:54.044203       1 builder.go:282] "Active resources" activeStoreNames="certificatesigningrequests,configmaps,cronjobs,daemonsets,deployments,endpoints,horizontalpodautoscalers,ingresses,jobs,leases,limitranges,mutatingwebhookconfigurations,namespaces,networkpolicies,nodes,persistentvolumeclaims,persistentvolumes,poddisruptionbudgets,pods,replicasets,replicationcontrollers,resourcequotas,secrets,services,statefulsets,storageclasses,validatingwebhookconfigurations,volumeattachments"
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

```bash
kubectl logs prometheus-kube-state-metrics-75b5bb4bf8-6h9js -n monitoring
```
Look for any error messages that might indicate issues in the setup.

### 2. Access Metrics from `kube-state-metrics`
You can port-forward the `kube-state-metrics` service to access the metrics directly:
```bash
kubectl port-forward svc/prometheus-kube-state-metrics 8080:8080 -n monitoring
```
Then, open your browser and visit `http://localhost:8080/metrics` to see the raw metrics being exposed by `kube-state-metrics`.

### 3. Verify in Prometheus
Since you have Prometheus installed, you can also check if Prometheus is scraping the `kube-state-metrics`. First, look at your Prometheus targets:
```bash
kubectl port-forward svc/prometheus-server 9090:9090 -n monitoring
```
Then open your browser and go to `http://localhost:9090/targets`. You should see `kube-state-metrics` as one of the targets. If it is listed and up, you can query `kube-state-metrics` data from within Prometheus.

### 4. Query `kube-state-metrics` Data in Prometheus
Once you have confirmed that Prometheus is scraping `kube-state-metrics`, you can query the metrics in Prometheus using a query like:
```promql
kube_pod_info
```
This will provide information about all the pods in the cluster.

### Troubleshooting Tips
- If `kube-state-metrics` is not listed as a target, check the Prometheus configuration to ensure it's set up to scrape the `kube-state-metrics` service.
- If the pod is restarting or failing, use `kubectl describe pod <pod-name> -n monitoring` to investigate further.

Let me know if you'd like more help debugging!