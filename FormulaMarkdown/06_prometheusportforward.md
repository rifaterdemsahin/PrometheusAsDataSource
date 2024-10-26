@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/prometheus-server 9090:80

NODE !!!!
CLUSTER XXXX
Forwarding from 127.0.0.1:9090 -> 9090
Forwarding from [::1]:9090 -> 9090


API SERVER STOPPED
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/prometheus-server 9090:80
The connection to the server 192.168.49.2:8443 was refused - did you specify the right host or port?
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/prometheus-server 9090:80
The connection to the server 192.168.49.2:8443 was refused - did you specify the right host or port?
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ minikube status
minikube
type: Control Plane
host: Running
kubelet: Stopped
apiserver: Stopped
kubeconfig: Configured
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ ^C
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ minikube start
😄  minikube v1.34.0 on Ubuntu 20.04 (docker/amd64)
✨  Using the docker driver based on existing profile
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.45 ...
🏃  Updating the running docker "minikube" container ...
🐳  Preparing Kubernetes v1.31.0 on Docker 27.2.0 ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: default-storageclass, storage-provisioner
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/prometheus-server 9090:80
Error from server (NotFound): services "prometheus-server" not found
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ ^C
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ minikube start
😄  minikube v1.34.0 on Ubuntu 20.04 (docker/amd64)
✨  Using the docker driver based on existing profile
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.45 ...
🏃  Updating the running docker "minikube" container ...
🐳  Preparing Kubernetes v1.31.0 on Docker 27.2.0 ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: default-storageclass, storage-provisioner
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ kubectl port-forward svc/prometheus-server 9090:80
Error from server (NotFound): services "prometheus-server" not found
@rifaterdemsahin ➜ /workspaces/PrometheusAsDataSource (main) $ 

git pull; git add . && git commit -m "Refine task priorities in kanban board" && git push;clear.exe 