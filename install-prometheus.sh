helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm delete prometheus || true
kubectl delete -f prometheus/ingress.yaml || true
sleep 5
helm install prometheus prometheus-community/prometheus -f ./prometheus/values.yaml
kubectl apply -f prometheus/ingress.yaml
