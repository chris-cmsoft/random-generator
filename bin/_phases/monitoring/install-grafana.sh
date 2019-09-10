#! /bin/sh

kubectl apply -f monitoring/grafana/grafana-data-source-config-map.yml >> /dev/null

helm upgrade --install grafana stable/grafana \
    -f monitoring/grafana/values.yml \
    --namespace monitoring >> /dev/null
