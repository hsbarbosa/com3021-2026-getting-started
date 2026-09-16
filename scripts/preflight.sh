#!/usr/bin/env bash
set -u
CONFIG_FILE="${COM3021_CONFIG:-$HOME/com3021/project.env}"
echo "COM3021 preflight"
if [[ ! -f "$CONFIG_FILE" ]]; then echo "CONFIG: FAIL — missing $CONFIG_FILE"; exit 1; fi
source "$CONFIG_FILE"
account="$(gcloud auth list --filter=status:ACTIVE --format='value(account)' 2>/dev/null)"
active_project="$(gcloud config get-value project 2>/dev/null)"
echo "ACCOUNT: ${account:-FAIL}"
echo "PROJECT_CONFIG: ${GCP_PROJECT_ID:-FAIL}"
echo "PROJECT_ACTIVE: ${active_project:-FAIL}"
if [[ -z "$account" || -z "${GCP_PROJECT_ID:-}" || "$active_project" != "$GCP_PROJECT_ID" ]]; then echo "PROJECT CONTEXT: FAIL"; exit 1; fi
if gcloud projects describe "$GCP_PROJECT_ID" >/dev/null 2>&1; then echo "PROJECT ACCESS: PASS"; else echo "PROJECT ACCESS: FAIL"; exit 1; fi
billing="$(gcloud beta billing projects describe "$GCP_PROJECT_ID" --format='value(billingEnabled)' 2>/dev/null || true)"
if [[ "$billing" == "True" ]]; then echo "BILLING ENABLED: PASS"; else echo "BILLING ENABLED: FAIL OR UNABLE TO VERIFY"; fi
echo "EDUCATION CREDITS: CONFIRM IN CONSOLE"
echo "STATUS: READY ONLY IF BILLING AND EDUCATION CREDITS ARE CONFIRMED"
