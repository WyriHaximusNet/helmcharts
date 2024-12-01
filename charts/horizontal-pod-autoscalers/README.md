# Horizontal Pod Autoscalers

> **:exclamation: This Helm Chart is deprecated!**

<p align="center">
  <img src="https://helm.wyrihaximus.net/images/charts/horizontal-pod-autoscalers.png">
</p>

Opinionated helm library chart for easy creation of horizontal pod autoscalers.

# Example

Very basic example that uses the current apps fullname and replica count as minimum replicate count, defaults to 1024 as the max replica count:

```gotemplate
{{- include "horizontal-pod-autoscalers.hpa" (dict "name" (include "default-backend.fullname" .) "replicas" (dict "min" .Values.replicas)) -}}
```

The following configuration options are available:

```yaml
name: your-applications-deployment-name # Required, this MUST match the deployment we're autoscaling
replicas:
    min: 2 # Optional, defaults to 2, but strongly suggest making it match the deployment replica count
    max: 1024 # Optional, defaults to 1024
```

## Opinionated decisions

* requires kubernetes ^1.18
* 1024 max replica's
* scales when average CPU usage goes above 50%
* scaling down happens at one pod a minute
