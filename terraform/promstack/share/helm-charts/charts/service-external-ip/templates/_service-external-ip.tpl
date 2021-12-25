{{/* Expands the name of the serviceExternalIp. */}}
{{- define "serviceExternalIp.name" -}}
{{- if .Values.serviceExternalIp.nameOverride }}
{{- include "sanitize" .Values.serviceExternalIp.nameOverride }}
{{- else }}
{{- include "sanitize" (cat (include "chart.fullname" .) "serviceExternalIp" ) -}}
{{- end }}
{{- end -}}

{{/* custom: label mapping */}}
{{- define "serviceExternalIp.app" -}}
app: "{{- include "sanitize" .Values.serviceExternalIp.labels.app }}"
{{- end -}}

{{/* Expands selector labels of the serviceExternalIp. */}}
{{- define "serviceExternalIp.selector" -}}
{{ include "chart.selector" . }}
app: "{{ include "serviceExternalIp.name" . }}"
{{- end -}}

{{/* Expand common labels of the serviceExternalIp. */}}
{{- define "serviceExternalIp.labels" -}}
{{ include "serviceExternalIp.app" . }}
{{- end -}}

{{/* Expand annotation labels of the serviceExternalIp. */}}
{{- define "serviceExternalIp.annotations" -}}
{{- $annotations := merge .Values.serviceExternalIp.annotations .Values.annotations -}}
{{- with $annotations }}
{{ include "quote.object" -}}
{{- end -}}
{{- end -}}
