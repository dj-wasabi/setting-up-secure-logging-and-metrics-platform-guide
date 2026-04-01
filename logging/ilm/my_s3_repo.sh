curl -k -u "elastic:yUKN4DicRmLPUVTtFZcSgjCq" \
  -X PUT "https://quickstart-es-http.logging.svc.cluster.local:9200/_snapshot/my_s3_repo" \
  -H 'Content-Type: application/json' \
  -d '{
  "type": "s3",
  "settings": {
    "bucket": "my-awesome-backup-place-for-elasticsearch",
    "region": "eu-west-1"
  }
}'