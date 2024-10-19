@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get svc prometheus-server -o jsonpath='{.spec.ports[*].port}'
# Replace 9090 with the correct port number from the output above
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/prometheus-server <correct-port>:9090
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

 
error: Service prometheus-server does not have a service port 9090
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ ^C
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get svc prometheus-server -o jsonpath='{.spec.ports[*].port}'
80@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ ^C
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 



wrong name> kubectl port-forward svc/prometheus-server 9090:80


