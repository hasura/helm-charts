# This file and its contents are licensed under the Apache License 2.0.
# Please see the included NOTICE for copyright information and LICENSE for a copy of the license.

{{- define "common.prefix" -}}
  {{- print (coalesce (.Values.global).prefixOverride .Release.Name) -}}
{{- end }}

{{- define "common.name" -}}
  {{- if .Values.nameOverride  -}}
    {{- print .Values.nameOverride -}}
  {{- else -}}
    {{- printf "%s-graphql-engine" (include "common.prefix" .) -}}
  {{- end -}}
{{- end }}

{{- define "common.namespace" -}}
  {{- print (coalesce .Values.namespaceOverride (.Values.global).namespaceOverride .Release.Namespace) -}}
{{- end -}}

{{- define "common.labels" -}}
  app: {{ template "common.name" . }}
{{- range $key, $val := .Values.labels }}
{{ $key }}: {{ $val | quote }}
{{- end }}
{{- end }}

{{- define "common.image" -}}
  {{- if .Values.global.imageRegistry -}}
    {{- printf "%s/%s:%s" (.Values.global).imageRegistry .repository (required "Tag is mandatory" .tag) -}}
  {{- else -}}
    {{- printf "%s:%s" .repository (required "Tag is mandatory" .tag) -}}
  {{- end -}}
{{- end -}}

{{- define "common.configMapName" -}}
{{- $configName := coalesce (.Values.config).name (.Values.configs).name -}}
{{- if $configName -}}
  {{- print $configName -}}
{{- else -}}
  {{- printf "%s-configs" (include "common.prefix" .) -}}
{{- end -}}
{{- end }}

{{- define "common.secretsName" -}}
{{- $secretName := (.Values.secret).name -}}
{{- if $secretName -}}
  {{- print $secretName }}
{{- else -}}
  {{- printf "%s-secrets" (include "common.prefix" .) }}
{{- end -}}
{{- end }}

{{- define "db.url" -}}
{{- if (.Values.secret).metadataDbUrl -}}
  {{- print .Values.secret.metadataDbUrl -}}
{{- else -}}
  {{- $username := (.Values.postgres.auth).username -}}
  {{- $password := (.Values.postgres.auth).password  -}}
  {{- $database := (.Values.postgres.auth).database -}}
  {{- $serviceName := include "postgres.name" . -}}
  {{- printf "postgres://%s:%s@%s:5432/%s" $username $password $serviceName $database -}}
{{- end -}}
{{- end -}}

{{- define "hge.enabledApis" -}}
{{- $hgeEnabledApis := coalesce (.Values.config).enabledApis "" -}}
{{- if or (.Values.secret).metricsSecret -}}
  {{- if contains "metrics" $hgeEnabledApis -}}
    {{- print $hgeEnabledApis -}}
  {{- else -}}
    {{- printf "%s,metrics" (coalesce $hgeEnabledApis "metadata,graphql,config") -}}
  {{- end -}}
{{- else -}}
  {{- print $hgeEnabledApis -}}
{{- end -}}
{{- end -}}