# Docker Hub Exporter

<p align="center">
  <img src="https://helm.wyrihaximus.net/images/charts/docker-hub-exporter.png">
</p>

Opinionated helm chart for [`jessestuart/docker-hub-exporter`](https://github.com/jessestuart/docker-hub-exporter).

## Configuration

While the underlying docker image supports specific docker images this helm chart only lets you configure 
`organisations`. There are also two dashboards included, one for InfluxDB and one for Prometheus.

### Sample configuration

```yaml
organisations: wyrihaximusnet

grafana:
  prometheus: true
```

## Opinionated decisions

* Port is hardcoded to `9170` for the metrics.
* Only gather metrics for full organizations and users.
