# service-external-ip

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| annotations | object | `{}` | Annotations used in all application resources. |
| serviceExternalIp.affinity | object | `{}` | Deployment affinity configuration. If not set the default one will be used. |
| serviceExternalIp.annotations | object | `{}` | Annotations used in the serviceExternalIp resources. |
| serviceExternalIp.labels.app | string | `"custom-label"` |  |
| serviceExternalIp.name | string | `"template"` |  |
| serviceExternalIp.nodeSelector | object | `{}` | NodeSelector configuration of the serviceExternalIp. |
| serviceExternalIp.service.enabled | bool | `false` |  |
| serviceExternalIp.service.endpoints.ip | string | `"1.1.1.1"` |  |
| serviceExternalIp.service.ports.name | string | `"http"` |  |
| serviceExternalIp.service.ports.port | string | `"80"` |  |
| serviceExternalIp.service.ports.protocol | string | `"TCP"` |  |
| serviceExternalIp.service.ports.targetPort | string | `"80"` |  |
| serviceExternalIp.tolerations | list | `[]` | Tolerations of the serviceExternalIp pods. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)