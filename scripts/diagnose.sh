#!/usr/bin/env bash
set -u
CONFIG_FILE="${COM3021_CONFIG:-$HOME/com3021/project.env}"
echo "COM3021 diagnostics"
echo "Time: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "Account: $(gcloud auth list --filter=status:ACTIVE --format='value(account)' 2>/dev/null || echo unavailable)"
echo "Active project: $(gcloud config get-value project 2>/dev/null || echo unavailable)"
if [[ -f "$CONFIG_FILE" ]]; then source "$CONFIG_FILE"; echo "Configured project: ${GCP_PROJECT_ID:-missing}"; echo "Configured region: ${GCP_REGION:-missing}"; echo "Configured bucket: ${GCS_BUCKET:-missing}"; else echo "Configuration: missing $CONFIG_FILE"; fi
if [[ -n "${GCP_PROJECT_ID:-}" ]]; then gcloud beta billing projects describe "$GCP_PROJECT_ID" --format='yaml(projectId,billingAccountName,billingEnabled)' 2>&1 || true; fi
if [[ -n "${GCS_BUCKET:-}" ]]; then gcloud storage buckets describe "gs://$GCS_BUCKET" --format='yaml(name,location,storageClass)' 2>&1 || true; fi
