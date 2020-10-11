# Cron Jobs

<p align="center">
  <img src="https://helm.wyrihaximus.net/images/charts/cron-jobs.png">
</p>

Opinionated helm library chart for easy creation of cron jobs.

# Example

Very basic example without any customization:

```gotemplate
{{- range $job := .Values.jobs }}
{{- include "cron-jobs.cronjob" $job -}}
{{- end }}
```

The following values will run a cronjob that sleeps for 1 second any minute

```yaml
jobs:
  - name: sleep
    schedule: "* * * * *"
    labels:
      cronjob:
        key: value
      jobTemplate:
        key: value
    container:
      command: ["sleep"]
      args: ["1"]
      resources:
        limits:
          cpu: 1m
          memory: 12Mi
        requests:
          cpu: 1m
          memory: 12Mi
    image:
      repository: alpine
      tag: 3.12
      pullPolicy: IfNotPresent
```

## Opinionated decisions

* A history of `3` failed and `3` successful jobs are kept around for log checking.
* No restarts
* No concurrently
* A single container per cron job
* `cron` and `name` labels are set on each cron job with the name you give it