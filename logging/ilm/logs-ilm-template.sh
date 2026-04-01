curl -k -u "elastic:yUKN4DicRmLPUVTtFZcSgjCq" \
  -X PUT "https://quickstart-es-http.logging.svc.cluster.local:9200/_index_template/logs-ilm-template" \
  -H 'Content-Type: application/json' \
  -d '{
  "index_patterns": ["filebeat-*", "metricbeat-*", "falco-*"],
  "template": { "settings": { "index.lifecycle.name": "logs-ilm-policy" } }
}'