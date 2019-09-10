#! /bin/sh

kubectl apply -f tiller/ >> /dev/null
helm init --service-account tiller --wait >> /dev/null
