{{/* vim: set filetype=mustache: */}}
{{/*
Create the name of the service account to use
*/}}
{{- define "redirect.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "commons.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Host rule
*/}}
{{- define "redirect.hostRule" -}}
- host: {{ .Host | quote }}
  http:
    paths:
      - path: /
        backend:
          serviceName: {{ .FullName }}
          servicePort: {{ .SvcPort }}
{{- end -}}

{{/*
Host TLS config
*/}}
{{- define "redirect.hostTLS" -}}
- hosts:
  - {{ .Host | quote }}
  secretName: tls-{{ .Host | replace "." "-" }}
{{- end -}}
