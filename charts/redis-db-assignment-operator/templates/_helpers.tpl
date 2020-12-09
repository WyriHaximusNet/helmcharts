{{/* vim: set filetype=mustache: */}}
{{/*
Create the name of the service account to use
*/}}
{{- define "redis-db-assignment-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "commons.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
