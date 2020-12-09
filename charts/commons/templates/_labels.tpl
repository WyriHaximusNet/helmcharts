{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "commons.labels" -}}
app: {{ template "commons.name" . }}
app.kubernetes.io/instance: {{ template "commons.instance" . }}
app.kubernetes.io/name: {{ template "commons.name" . }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
appRevision: {{ template "commons.nameRevision" . }}
chart: {{ template "commons.chart" . }}
release: {{ .Release.Name }}
releaseRevision: {{ .Release.Revision | quote }}
heritage: {{ .Release.Service }}
{{- end -}}
