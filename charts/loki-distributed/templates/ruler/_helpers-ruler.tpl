{{/*
ruler fullname
*/}}
{{- define "loki.rulerFullname" -}}
{{ include "loki.fullname" . }}-ruler
{{- end }}

{{/*
ruler common labels
*/}}
{{- define "loki.rulerLabels" -}}
{{ include "loki.labels" . }}
app.kubernetes.io/component: ruler
{{- end }}

{{/*
ruler selector labels
*/}}
{{- define "loki.rulerSelectorLabels" -}}
{{ include "loki.selectorLabels" . }}
app.kubernetes.io/component: ruler
{{- end }}

{{/*
ruler image
*/}}
{{- define "loki.rulerImage" -}}
{{- $dict := dict "loki" .Values.loki.image "service" .Values.ruler.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
{{- include "loki.lokiImage" $dict -}}
{{- end }}

{{/*
format rules dir
*/}}
{{- define "loki.rulerCreateRulesDirName" -}}
rules-{{ . | replace "_" "-" | trimSuffix "-" }}
{{- end }}