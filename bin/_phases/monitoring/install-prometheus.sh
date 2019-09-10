#! /bin/sh

helm upgrade --install prometheus stable/prometheus \
    --namespace monitoring >> /dev/null
