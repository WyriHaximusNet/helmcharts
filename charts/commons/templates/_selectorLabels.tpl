{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "commons.selectorLabels" -}}
app: {{ template "commons.name" . }}
release: {{ .Release.Name }}
{{- end -}}
