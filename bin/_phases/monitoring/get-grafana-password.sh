#! /bin/sh

PASSWORD=$(kubectl get secret \
    --namespace monitoring \
    grafana \
    -o jsonpath="{.data.admin-password}" \
    | base64 --decode ; echo)

echo 'USER=admin' >> .grafana
echo "PASSWORD=${PASSWORD}" >> .grafana
