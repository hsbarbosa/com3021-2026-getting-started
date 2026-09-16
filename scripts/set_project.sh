#!/usr/bin/env bash
set -euo pipefail
CONFIG_FILE="${COM3021_CONFIG:-$HOME/com3021/project.env}"
source "$CONFIG_FILE"
gcloud config set project "$GCP_PROJECT_ID"
gcloud config set compute/region "$GCP_REGION"
echo "Configured project $GCP_PROJECT_ID in region $GCP_REGION"
