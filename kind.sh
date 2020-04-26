kind delete cluster
cat <<EOF > kind-example-config.yaml
# three node (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF
kind create cluster --config kind-example-config.yaml
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install ngnix  stable/nginx-ingress

#kubectl create ns airflow
helm install "airflow" stable/airflow

cat <<EOF > ingress-example.yaml
apiVersion: networking.k8s.io/v1beta1 # for versions before 1.14 use extensions/v1beta1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1
spec:
  rules:
  - host: hello-world.info
    http:
      paths:
      - path: /
        backend:
          serviceName: airflow-web
          servicePort: 8080
EOF
kubectl apply -f ingress-example.yaml
