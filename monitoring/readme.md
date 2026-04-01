


helm upgrade cilium cilium/cilium --version 1.19.1 --namespace kube-system -f values-cilium.yaml -f values-cilium-monitoring.yaml
   <!-- --set hubble.metrics.enabled="{dns,drop,tcp,flow,port-distribution,icmp,httpV2:exemplars=true;labelsContext=source_ip\,source_namespace\,source_workload\,destination_ip\,destination_namespace\,destination_workload\,traffic_direction}" -->


kubectl create ns monitoring
kubectl apply -f monitoring/gateway-start.yaml

```bash
$ kubectl get certificate -A
NAMESPACE      NAME                     READY   SECRET                   AGE
cert-manager   our-own-ca               True    our-own-ca               3m37s
monitoring     monitoring-gateway-tls   True    monitoring-gateway-tls   2m38s
```

$ kubectl apply -f monitoring/thanos-s3.yaml
secret/thanos-s3-config created


```bash
$ helm upgrade --install prometheus oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack \
  --namespace monitoring \
  --version 82.10.3 \
  -f monitoring/values-prometheus.yaml \
  -f monitoring/values-prometheus-ha.yaml
```


helm upgrade --install thanos-query bitnami/thanos --namespace monitoring --version 17.3.1 -f monitoring/values-thanos.yaml


kubectl get secret prometheus-grafana -n monitoring -o jsonpath='{.data.admin-password}' | base64 -d


# Dashboard
# 21431
# 20842

helm install falco falcosecurity/falco \
  -n falco --create-namespace \
  -f values-falco.yaml \
  -f values-falco-monitoring.yaml


### 


curl -u "falco:MySeCreTValu3"   -X POST "https://quickstart-es-http.default.svc.cluster.local:9200/falco-2026.03.08/_doc"   -k   -H 'Content-Type: application/json'   -d '{"event": "test from falco", "@timestamp": "2026-03-08T11:30:00Z"}'






# Using mTLS

helm upgrade --install prometheus oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack --namespace monitoring --version 82.10.3 -f monitoring/values-prometheus.yaml -f monitoring/values-prometheus-ha-tls.yaml
helm upgrade --install thanos-query bitnami/thanos --namespace monitoring --version 17.3.1 -f monitoring/values-thanos.yaml -f monitoring/values-thanos-tls.yaml

