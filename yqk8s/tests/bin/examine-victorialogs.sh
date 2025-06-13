#!/usr/bin/env bash

helm template vlc oci://ghcr.io/victoriametrics/helm-charts/victoria-logs-cluster -n your-namespace
