@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 
kubectl port-forward svc/grafana 3000:80 -n monitoring
Forwarding from 127.0.0.1:3000 -> 3000
Forwarding from [::1]:3000 -> 3000


source : 3000 >>>> load minikube port
destionation : 80 >> load balancer entry