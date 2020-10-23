# Redirect

<p align="center">
  <img src="https://helm.wyrihaximus.net/images/charts/redirect.png">
</p>

Opinionated helm chart for [`wyrihaximusnet/redirect`](https://github.com/wyrihaximusnet/docker-redirect).

## Provided tags

* `random` - Each time when the images are build a random image is selected and build.
* `reactphp` - Using [ReactPHP](https://reactphp.org/)
* `nodejs` - Using [NodeJS](https://nodejs.org/en/)

## Configuration

These images comes with 3 mandatory configuration options:
* `redirect.defaultFallbackTarget` - Requests not matching other rules will be redirected here 
* `redirect.buildin` - Can be either `nonWwwToWww` or `wwwToNonWww`, anything else will make the image error and stop

There is also one optional configuration option for custom hostname based redirection:
* `redirect.hosts` - from -> to based key value mapping

While the Docker image doesn't care, for the helm chart you also have to supply all the `redirect.ingressHosts` you 
intend to be handled by this chart.

Full configuration example:

```yaml
redirect:
# The default fallback is use in case the application can't find a domain to redirect to within the other configuration options
  defaultFallbackTarget: https://www.wyrihaximus.net/
  enforceHttps: true
  buildin: wwwToNonWww
  hosts:
    www.ceesjankiewiet.nl: wyrihaximus.net
  ingressHosts:
    - www.wyrihaximus.net

# Enable horizontal pod autoscaler
hpa:
  enable: true

# Cron job that replaces the oldest pod weekly
cron:
  replaceOldestPodWeekly: false
```

Keep in mind that the configuration options are executed in the following order:
1. `redirect.hosts`
2. `redirect.buildin`
3. `redirect.defaultFallbackTarget`

## Opinionated decisions

* requires kubernetes ^1.18
* Ports are hardcoded to `7132` for the service, and `7133` for the metrics.
* TLS is assumed to be required, and is set up based on supplied hosts in `redirect.hosts` and `redirect.ingressHosts`.
* It's assumed that this helm chart will be run in it's own namespace, so the naming for all resources is kept as simple as possible.
* Prometheus export annotations are added for metric scraping.
* The default tag is random to randomly cycle through the different implementations, here is the [why](https://github.com/WyriHaximusNet/docker-redirect#why).
* Comes with a pod
* Replace oldest pod every week to hook into the weekly random image retagging
