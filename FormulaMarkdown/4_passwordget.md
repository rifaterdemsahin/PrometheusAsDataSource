@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
bzvGV6CXo7eGSJlIa6yipzlpCZMVPvtGOcEtjiko


username : admin