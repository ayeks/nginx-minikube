cd examples
kubectl delete -f .
cd ..
helm delete prometheus || true
kubectl delete -f prometheus/ingress.yaml || true