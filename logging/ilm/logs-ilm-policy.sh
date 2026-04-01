curl -k -u "elastic:yUKN4DicRmLPUVTtFZcSgjCq" \
  -X PUT "https://quickstart-es-http.logging.svc.cluster.local:9200/_ilm/policy/logs-ilm-policy" \
  -H 'Content-Type: application/json' \
  -d '{
  "policy": {
    "phases": {
      "hot": { "actions": { "rollover": { "max_age": "1d" } } },
      "warm": { "min_age": "7d", "actions": { "shrink": { "number_of_shards": 1 } } },
      "delete": { "min_age": "30d", "actions": { "delete": {} } }
    }
  }
}'