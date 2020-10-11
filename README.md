# WyriHaximus.net Helm charts

Opinionated helm chats for my personal projects, and OSS Projects that either don't have public helm charts, and don't meet my requirements for them.

## Charts in this repository

* [`cron-jobs`](https://hub.helm.sh/charts/wyrihaximusnet/cron-jobs)
* [`default-backend`](https://hub.helm.sh/charts/wyrihaximusnet/default-backend)
* [`docker-hub-exporter`](https://hub.helm.sh/charts/wyrihaximusnet/docker-hub-exporter)
* [`redirect`](https://hub.helm.sh/charts/wyrihaximusnet/redirect)
* [`redis-db-assignment-operator`](https://hub.helm.sh/charts/wyrihaximusnet/redis-db-assignment-operator)


## Opinionated decisions shared by all charts

* All have pod anti-affinity to be not be on the same node
* All deployments have a pod disruption budget that only allows one unavailble pod when there are more then one replicas
