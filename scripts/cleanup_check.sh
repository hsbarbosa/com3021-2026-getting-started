#!/usr/bin/env bash
set -u
project="$(gcloud config get-value project 2>/dev/null)"
echo "Project: $project"
echo "Review billing before leaving. Stop or delete temporary compute, endpoints, clusters and streaming jobs."
gcloud compute instances list --format='table(name,zone,status)' 2>/dev/null || true
gcloud run services list --format='table(name,region)' 2>/dev/null || true
gcloud dataflow jobs list --region=europe-west2 --format='table(name,state)' 2>/dev/null || true
