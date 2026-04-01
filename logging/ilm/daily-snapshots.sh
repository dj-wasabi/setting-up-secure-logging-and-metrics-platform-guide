curl -k -u "elastic:yUKN4DicRmLPUVTtFZcSgjCq" \
  -X PUT "https://quickstart-es-http.logging.svc.cluster.local:9200/_slm/policy/daily-snapshots" \
  -H 'Content-Type: application/json' \
  -d '{
  "schedule": "0 30 1 * * ?",
  "name": "<daily-snap-{now/d}>",
  "repository": "my_s3_repo",
  "config": { "indices": ["filebeat-*", "metricbeat-*", "falco-*"] },
  "retention": { "expire_after": "30d", "min_count": 5, "max_count": 50 }
}'