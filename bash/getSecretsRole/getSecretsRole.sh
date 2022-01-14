# получает роли который имеют в ролях secrets
kubectl get clusterroles -o json |  jq '.items[] |  select(.rules[]?.resources[]? | contains("secrets")) | .metadata.name' | uniq
