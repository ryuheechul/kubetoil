#!/usr/bin/env bash

helm repo add grafana https://grafana.github.io/helm-charts &>/dev/null

cat <<EOF | helm template --values /dev/stdin loki grafana/loki
loki:
  schemaConfig:
    configs:
      - from: "2024-04-01"
        store: tsdb
        object_store: s3
        schema: v13
        index:
          prefix: loki_index_
          period: 24h
  ingester:
    chunk_encoding: snappy
  querier:
    # Default is 4, if you have enough memory and CPU you can increase, reduce if OOMing
    max_concurrent: 4
  pattern_ingester:
    enabled: true
  limits_config:
    allow_structured_metadata: true
    volume_enabled: true

deploymentMode: SimpleScalable

backend:
  replicas: 2
read:
  replicas: 2
write:
  replicas: 3 # To ensure data durability with replication

# Enable minio for storage
minio:
  enabled: true

gateway:
  service:
    type: LoadBalancer
EOF
