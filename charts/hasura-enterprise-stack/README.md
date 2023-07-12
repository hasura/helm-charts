# Hasura Enterprise Stack Helm Chart

This chart deploys the complete end-to-end Hasura GraphQL Engine Enterprise ecosystem solution in Kubernetes.

Components included in this package:

- [GraphQL Engine](../graphql-engine) 
- [GraphQL Data Connector](../graphql-data-connector)
- [Mongo Data Connector](../mongo-data-connector)
- [Bitnami package for Redis(R)](https://github.com/bitnami/charts/tree/main/bitnami/redis)
- [Dex](https://github.com/dexidp/helm-charts/tree/master/charts/dex)
- [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
- [Jaeger](https://github.com/jaegertracing/helm-charts)

## Prerequisites

1. Kubernetes 1.16+
2. Helm v3.8.0 or above. 
3. Hasura helm repo configured.

> The Bitnami repository has been moved to OCI-based registries that are GA supported in by Helm since v3.8.0. If you use the helm chart prior to v3.8.0, you need to enable the [experiment environment](https://helm.sh/docs/topics/registries/#oci-support-prior-to-v380).  

## Get Started

### Install Helm Chart

```bash
helm install [RELEASE_NAME] hasura/hasura-enterprise-stack
```
See [configuration](#parameters) below.

See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation.

### Configuration Examples

See configuration examples [here](./examples). 

### Uninstall Helm Chart

```bash
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation.

## Parameters 

### Global parameters

| Name                               | Description                                            | Value                 |
| ---------------------------------- | ------------------------------------------------------ | --------------------- |
| `global.imageRegistry`             | Global Docker image registry                           | `""`                  |
| `global.imagePullSecrets`          | Global Docker registry secret names as an array        | `[]`                  |
| `global.prefixOverride`            | Override the naming prefix instead of the release name | `{{ .Release.Name }}` |
| `global.redis.enabled`             | Enable Redis helm chart                                | `false`               |
| `global.redis.password`            | Specify the Redis authentication password              | `redispassword`       |
| `global.connector.graphql.enabled` | Enable the GraphQL Data Connector helm chart           | `false`               |
| `global.connector.mongo.enabled`   | Enable the Mongo Data Connector helm chart             | `false`               |

### GraphQL Engine

See all configurable options at the [GraphQL Engine helm chart](../graphql-engine). 

| Name                     | Description                          | Value  |
| ------------------------ | ------------------------------------ | ------ |
| `graphql-engine.enabled` | Enable the GraphQL Engine helm chart | `true` |

### GraphQL Data Connector

See all configurable options at the [GraphQL Data Connector helm chart](../graphql-data-connector). 

### Mongo Data Connector

See all configurable options at the [Mongo Data Connector helm chart](../mongo-data-connector). 

### Redis

See all configurable options at the [Redis helm chart](https://github.com/bitnami/charts/tree/main/bitnami/redis). 

### Dex

See all configurable options at the [Dex helm chart](https://github.com/dexidp/helm-charts/tree/master/charts/dex). 

| Name          | Description               | Value   |
| ------------- | ------------------------- | ------- |
| `dex.enabled` | Enable the Dex helm chart | `false` |

### Kube Prometheus Stack

See all configurable options at the [Kube Prometheus Stack helm chart](https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/values.yaml). 

Pre-built Grafana Dashboards for GraphQL Engine are configured by default.

| Name                            | Description                                 | Value   |
| ------------------------------- | ------------------------------------------- | ------- |
| `kube-prometheus-stack.enabled` | Enable the Kube Prometheus Stack helm chart | `false` |

### Jaeger

See all configurable options at the [Jaeger helm chart](https://github.com/jaegertracing/helm-charts). 

| Name              | Description | Value |
| ----------------- | ----------- | ----- |
| `jaeger.enabled`  | Enable the  |
| Jaeger helm chart | `false`     |
