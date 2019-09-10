#! /bin/sh

#############
# Go to Root directory, install all components, and return to original directory
#############

# Make sure to return to original directory
function cleanup {
  echo "Exiting gracefully"
  cd ${ORIGDIR}
}

# Trap exit so we can cleanup first
trap cleanup SIGKILL SIGHUP SIGINT

###############################
# Go to root directory first to make installers a bit easier to run
###############################

ROOTDIR=$(git rev-parse --show-toplevel)
ORIGDIR=$(pwd)

echo 'Changing directory to root'
cd ${ROOTDIR}


###############################
# Setup options
###############################
SKIP_HELM=0
SKIP_MONITORING=0
SKIP_LOGGING=0

###############################
# Install components
###############################
BASE_PHASE_DIR='./bin/_phases'
MONITORING_PHASE_DIR="${BASE_PHASE_DIR}/monitoring"
LOGGING_PHASE_DIR="${BASE_PHASE_DIR}/logging"

function hash_split {
  echo '############################'
  echo $1
  echo '############################'
}


if [ ${SKIP_HELM} == 0 ]
then
    hash_split 'Helm setup ...'

    echo 'Installing Tiller ...'
    sh ${BASE_PHASE_DIR}/install-tiller.sh

    echo 'Updating Helm Repo ...'
    helm repo update >> /dev/null
else
    hash_split 'Skipping Helm ...'
fi

if [ ${SKIP_MONITORING} == 0 ]
then
    hash_split 'Monitoring setup ...'

    echo 'Creating Monitoring Namespace ...'
    sh ${MONITORING_PHASE_DIR}/install-monitoring-namespace.sh

    echo 'Installing Prometheus ...'
    sh ${MONITORING_PHASE_DIR}/install-prometheus.sh

    echo 'Installing Grafana ...'
    sh ${MONITORING_PHASE_DIR}/install-grafana.sh

    echo 'Getting Grafana Password ...'
    sh ${MONITORING_PHASE_DIR}/get-grafana-password.sh
else
    hash_split 'Skipping Monitoring ...'
fi

if [ ${SKIP_LOGGING} == 0 ]
then
    hash_split 'Logging Setup'

    echo 'Ensuring Namespace ...'
    sh ${LOGGING_PHASE_DIR}/install-logging-namespace.sh

    echo 'Installing Elastic Search ...'
    sh ${LOGGING_PHASE_DIR}/install-elasticsearch.sh

    echo 'Installing Kibana ...'
    sh ${LOGGING_PHASE_DIR}/install-kibana.sh

    echo 'Installing Fluentd ...'
    sh ${LOGGING_PHASE_DIR}/install-fluentd.sh
else
    hash_split 'Skipping Monitoring ...'
fi
###############################
# Finish installing components
###############################

echo 'Changing directory to original'
cd ${ORIGDIR}
