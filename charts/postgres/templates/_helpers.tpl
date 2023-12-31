# This file and its contents are licensed under the Apache License 2.0.
# Please see the included NOTICE for copyright information and LICENSE for a copy of the license.

{{- define "common.prefix" -}}
  {{- print (coalesce (.Values.global).prefixOverride .Release.Name) -}}
{{- end }}

{{- define "common.namespace" -}}
  {{- print (coalesce .Values.namespaceOverride (.Values.global).namespaceOverride .Release.Namespace) -}}
{{- end -}}

{{- define "common.image" -}}
  {{- if (.Values.global).imageRegistry -}}
    {{- printf "%s/%s:%s" .Values.global.imageRegistry .repository (required "Tag is mandatory" .tag) -}}
  {{- else -}}
    {{- printf "%s:%s" .repository (required "Tag is mandatory" .tag) -}}
  {{- end -}}
{{- end -}}

{{- define "postgres.name" -}}
  {{- if .Values.nameOverride  -}}
    {{- print .Values.nameOverride -}}
  {{- else -}}
    {{- printf "%s-postgres" (include "common.prefix" .) -}}
  {{- end -}}
{{- end }}

{{- define "postgres.secretsName" -}}
  {{- printf "%s-postgres-secrets" (include "common.prefix" .) }}
{{- end }}
