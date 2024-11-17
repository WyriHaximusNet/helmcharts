# WyriHaximus.net Helm charts

Opinionated helm chats for my personal projects, and OSS Projects that either don't have public helm charts, and don't meet my requirements for them.

## Charts in this repository

### Application

* [`default-backend`](https://artifacthub.io/packages/helm/wyrihaximusnet/default-backend)
* [`docker-hub-exporter`](https://artifacthub.io/packages/helm/wyrihaximusnet/docker-hub-exporter)
* [`pi-hole-exporter`](https://artifacthub.io/packages/helm/wyrihaximusnet/pi-hole-exporter)
* [`redirect`](https://artifacthub.io/packages/helm/wyrihaximusnet/redirect)
* [`redis-db-assignment-operator`](https://artifacthub.io/packages/helm/wyrihaximusnet/redis-db-assignment-operator)

### Library

* [`commons`](https://artifacthub.io/packages/helm/wyrihaximusnet/commons)
* [`cron-jobs`](https://artifacthub.io/packages/helm/wyrihaximusnet/cron-jobs)
* [`commons`](https://artifacthub.io/packages/helm/wyrihaximusnet/commons)
* [`horizontal-pod-autoscalers`](https://artifacthub.io/packages/helm/wyrihaximusnet/horizontal-pod-autoscalers)

## Opinionated decisions shared by all charts

* All have pod anti-affinity to be not be on the same node
* All deployments have a pod disruption budget that only allows one unavailble pod when there are more then one replicas
