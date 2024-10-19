@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
kBxoMmykmIUEF6yGUlFNSv7DKXaz7Ubg8BYg6UBH
username : admin

