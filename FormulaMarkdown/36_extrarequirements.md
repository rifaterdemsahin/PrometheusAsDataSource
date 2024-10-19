Create a java hello world application
- Record the logs to Loki 📜
- Use Loki for application logs
- Use Prometheus for system logs
- Use Grafana 📊 and Prometheus 📈 to display metrics
- Deploy inside Minikube 🛠️ in Codespaces 💻
- Also deploy in Rancher environment

## Steps to Implement

Create a Java Hello World app

1. **Record the logs to Loki 📜**
    - Install Loki in your Kubernetes cluster.
    - Configure your Java Hello World application to send logs to Loki.
    - Verify logs from the Java application are being recorded in Loki.

2. **Use Loki for application logs**
    - Set up Loki as a log source in Grafana.
    - Create dashboards in Grafana to visualize application logs from Loki.

3. **Use Prometheus for system logs**
    - Install Promtail to collect system logs.
    - Configure Promtail to send logs to Prometheus.
    - Set up Grafana dashboards to visualize system logs from Prometheus.

4. **Use Grafana 📊 and Prometheus 📈 to display metrics**
    - Install Grafana and Prometheus in your Kubernetes cluster.
    - Configure Prometheus to scrape metrics from your applications.
    - Create Grafana dashboards to display these metrics.

5. **Deploy inside Minikube 🛠️ in Codespaces 💻**
    - Set up a Minikube cluster in your Codespaces environment.
    - Deploy your applications, Loki, Prometheus, and Grafana in Minikube.
    - Verify the deployment and functionality.

6. **Also deploy in Rancher environment**
    - Set up a Rancher-managed Kubernetes cluster.
    - Deploy your applications, Loki, Prometheus, and Grafana in the Rancher environment.
    - Verify the deployment and functionality.