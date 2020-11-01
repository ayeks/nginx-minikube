# nginx-minikube

Experiments with NGINX on minikube. Analog to [traefik-v2-minikube](https://github.com/ayeks/traefik-v2-minikube).

## Links

* [ingress-nginx Installation Guide](https://kubernetes.github.io/ingress-nginx/deploy/)
* [Differences Between nginxinc/kubernetes-ingress and kubernetes/ingress-nginx Ingress Controllers](https://github.com/nginxinc/kubernetes-ingress/blob/master/docs/nginx-ingress-controllers.md)

## Installation

Setup minikube with additional resources: `minikube start --cpus 4 --memory 8192`

Enable ingress addon: `minikube addons enable ingress`

Verify that the installation succeeded:

```bash
kubectl get pods -A -l app.kubernetes.io/name=ingress-nginx --watch
NAMESPACE     NAME                                       READY   STATUS      RESTARTS   AGE
kube-system   ingress-nginx-admission-create-29m9v       0/1     Completed   0          106s
kube-system   ingress-nginx-admission-patch-qkktj        0/1     Completed   0          106s
kube-system   ingress-nginx-controller-789d9c4dc-5dpg2   1/1     Running     0          106s
```

## Deploy a demo app

In the examples folder there are some demo services.

Deploy the whoami service with:

```bash
kubectl apply -f examples/whoami.yaml
```

Add the DNS entry for `whoami.minikube` to your `/etc/hosts` file. `minikube ip` tells you your ip.

```config
192.168.39.124 whoami.minikube
```

Access it with: <http://whoami.minikube>

## Deploy Prometheus

Deploying Prometheus into minikube and serving it via NGINX works as well.

```bash
./install-prometheus.yaml
```

Add the DNS entry for `prometheus.minikube` to your `/etc/hosts` file:

```config
192.168.39.124 prometheus.minikube
```

Open prometheus at: <https://prometheus.minikube/targets>
