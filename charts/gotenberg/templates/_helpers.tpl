{{/*
Return the proper image name
{{ include "image" ( dict "imageRoot" .Values.path.to.the.image "global" $) }}
*/}}

{{- define "gotenberg.image" -}}
{{- $registryName := .Values.global.imageRegistry | default .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "gotenberg.imagePullSecrets" -}}
{{ include "common.images.renderPullSecrets" (dict "images" (list .Values.image ) "context" $) }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "gotenberg.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}