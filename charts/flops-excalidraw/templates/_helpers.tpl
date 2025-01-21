{{/*
Expand the name of the chart.
*/}}
{{- define "excalidraw.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "excalidraw.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "excalidraw.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "excalidraw.labels" -}}
helm.sh/chart: {{ include "excalidraw.chart" . }}
{{ include "excalidraw.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "excalidraw.selectorLabels" -}}
app.kubernetes.io/name: {{ include "excalidraw.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "excalidraw.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "excalidraw.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}







{{/* Create the name of the service account to use */}}



{{/*
Create a default fully qualified room app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "excalidraw.room.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-room" (.Values.fullnameOverride | trunc 59 | trimSuffix "-") }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-room" (.Release.Name | trunc 59 | trimSuffix "-") }}
{{- else }}
{{- printf "%s-%s-room" (.Release.Name | trunc 59 | trimSuffix "-") ($name | trunc 59 | trimSuffix "-") }}
{{- end }}
{{- end }}
{{- end }}




{{/*
Room labels
*/}}
{{- define "excalidraw.room.labels" -}}
helm.sh/chart: {{ include "excalidraw.chart" . }}
{{ include "excalidraw.room.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "excalidraw.room.selectorLabels" -}}
app.kubernetes.io/name: {{ printf "%s-room" (include "excalidraw.name" .) }}
app.kubernetes.io/instance: {{ printf "%s-room" .Release.Name }}
{{- end }}