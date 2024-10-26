
While setting up the helm chart we get this output 

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
password 9zhsmjsxoVoG2m547IKU2Lw7i9qY5wJb5D9YSDCn
username : admin

