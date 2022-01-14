cat file | jq '.items[] |  "\(.metadata.name) \(.rules[]?.resources)}" '
cat file | jq '.items[] | select(.rules[]?.resources[]? | contains("secrets"))'
