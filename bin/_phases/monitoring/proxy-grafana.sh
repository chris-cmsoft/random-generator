#! /bin/sh

kubectl --namespace monitoring \
    port-forward $(kubectl get pods --namespace monitoring -l "app=grafana,release=grafana" -o jsonpath="{.items[0].metadata.name}") \
    3000
