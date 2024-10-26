
While setting up the Helm chart, you might see the following output:

```sh
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

👤 **Username:** `admin`
🔑 **Password:** `9zhsmjsxoVoG2m547IKU2Lw7i9qY5wJb5D9YSDCn`  
