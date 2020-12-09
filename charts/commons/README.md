# Commons

<p align="center">
  <img src="https://helm.wyrihaximus.net/images/charts/commons.png">
</p>

Opinionated helm library chart containing metadata helpers for helm application charts.

Example deployment using helpers from this chart:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ template "commons.fullname" . }}
  labels:
    {{- include "commons.labels" . | nindent 4 }}
    app.kubernetes.io/component: controller
spec:
  selector:
    matchLabels:
      {{- include "commons.selectorLabels" . | nindent 6 }}
  replicas: 1
  template:
    metadata:
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "9696"
      labels:
        {{- include "commons.labels" . | nindent 8 }}
    spec:
      containers:
        - name: default-backend
          image: "ghcr.io/wyrihaximusnet/default-backend:random"
          imagePullPolicy: Always
          ports:
            - name: default-backend
              containerPort: 6969
              protocol: TCP
            - name: metrics
              containerPort: 9696
              protocol: TCP
          livenessProbe:
            failureThreshold: 6
            httpGet:
              path: /
              port: metrics
          readinessProbe:
            failureThreshold: 6
            httpGet:
              path: /
              port: metrics
          startupProbe:
            httpGet:
              path: /
              port: metrics
            failureThreshold: 90
            periodSeconds: 1
          resources:
            limits:
              cpu: 75m
              memory: 64Mi
            requests:
              cpu: 75m
              memory: 64Mi
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: appRevision
                operator: In
                values:
                - {{ template "commons.nameRevision" . }}
            topologyKey: "kubernetes.io/hostname"

```
