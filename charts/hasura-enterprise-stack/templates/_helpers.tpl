{{- define "redis.url" -}}
{{- if ((.Values.global).redis).enabled -}}
  {{- $redisHost := printf "%s-redis-master" .Chart.Name -}}
  {{- printf "redis://:%s@%s:6379" .Values.global.redis.password $redisHost -}}
{{- else -}}
  {{- print "" -}}
{{- end -}}
{{- end -}}
