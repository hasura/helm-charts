# GraphQL Data Connector Helm Chart

This chart deploys the GraphQL Data Connector service.

## Prerequisites

1. Helm (preferably v3) installed – instructions are [here](https://helm.sh/docs/intro/install/).
2. Hasura helm repo configured.
  
```bash
helm repo add hasura https://hasura.github.io/helm-charts
helm repo update
```

> You can change the repo name `hasura` to another one if getting conflicts.

## Get Started

```bash
helm install [RELEASE_NAME] hasura/graphql-data-connector
```
See [configuration](#parameters) below.

See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation.

## Parameters 

| Name                                              | Description                                                                                                | Value                           |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `global.imageRegistry`                            | Global Docker image registry                                                                               | `""`                            |
| `global.imagePullSecrets`                         | Global Docker registry secret names as an array                                                            | `[]`                            |
| `global.prefixOverride`                           | Override the naming prefix instead of the release name                                                     | `{{ .Release.Name }}`           |
| `nameOverride`                                    | String to override the deployment name                                                                     | `""`                            |
| `namespaceOverride`                               | String to override the namespace                                                                           | `""`                            |
| `disableAnnotationTimestamp`                      | Disable the current timestamp annotation that force the pod to roll out                                    | `true`                          |
| `labels`                                          | Add labels to the deployment resource                                                                      | `{}`                            |
| `annotations`                                     | Add annotations to the deployment resource                                                                 | `{}`                            |
| `command`                                         | Customize the execution command                                                                            | `[]`                            |
| `args`                                            | Customize execution arguments                                                                              | `[]`                            |
| `replicas`                                        | Number of pod replicas                                                                                     | `1`                             |
| `image.registry`                                  | GraphQL Data Connector image registry                                                                      | `docker.io`                     |
| `image.repository`                                | GraphQL Data Connector image repository                                                                    | `hasura/graphql-data-connector` |
| `image.tag`                                       | GraphQL Data Connector image tag                                                                           | `v2.29.0`                       |
| `image.pullPolicy`                                | GraphQL Data Connector image pull policy                                                                   | `IfNotPresent`                  |
| `image.pullSecrets`                               | Specify image pull secrets                                                                                 | `[]`                            |
| `affinity`                                        | Affinity for GraphQL Data Connector pod assignment                                                         | `{}`                            |
| `nodeSelector`                                    | Node labels for GraphQL Data Connector pod assignment                                                      | `{}`                            |
| `tolerations`                                     | Tolerations for GraphQL Data Connector pod assignment                                                      | `{}`                            |
| `securityContext`                                 | Define privilege and access control settings for a Pod or Container                                        | `{}`                            |
| `initContainers`                                  | Additional initialization containers                                                                       | `[]`                            |
| `extraContainers`                                 | Optionally specify extra list of additional containers for the GraphQL Data Connector pod                  | `[]`                            |
| `extraVolumes`                                    | Optionally specify extra list of additional volumes for the GraphQL Data Connector pod                     | `[]`                            |
| `extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the GraphQL Data Connector container          | `[]`                            |
| `extraEnvs`                                       | Optionally specify extra list of additional environment variables for the pod                              | `[]`                            |
| `resources`                                       | Resource requests and limits of GraphQL Data Connector container                                           | `{}`                            |
| `serviceAccount.enabled`                          | Enable ServiceAccount for GraphQL Data Connector pod                                                       | `false`                         |
| `serviceAccount.name`                             | The name of the ServiceAccount to use                                                                      | `""`                            |
| `service.type`                                    | Kubernetes Service type of GraphQL Data Connector                                                          | `ClusterIP`                     |
| `service.labels`                                  | Optionally specify labels for GraphQL Data Connector Service                                               | `{}`                            |
| `service.annotations`                             | Optionally specify annotations for GraphQL Data Connector Service                                          | `{}`                            |
| `healthChecks.enabled`                            | Enable health check for GraphQL Data Connector container                                                   | `false`                         |
| `healthChecks.readinessProbe.httpGet.path`        | The health check endpoint for readinessProbe (You need to change the data source that you will connect to) | `/api/v1/mariadb/health`        |
| `healthChecks.readinessProbe.httpGet.port`        | The health check port for readinessProbe                                                                   | `8081`                          |
| `healthChecks.readinessProbe.initialDelaySeconds` |                                                                                                            | `5`                             |
| `healthChecks.readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                                                          | `10`                            |
| `healthChecks.readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                                                         | `5`                             |
| `healthChecks.readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                                                       | `5`                             |
| `healthChecks.readinessProbe.successThreshold`    | Success threshold for readinessProbe                                                                       | `1`                             |
| `healthChecks.livenessProbe.httpGet.path`         | The health check endpoint for livenessProbe (You need to change the data source that you will connect to)  | `/api/v1/mariadb/health`        |
| `healthChecks.livenessProbe.httpGet.port`         | The health check port for readinessProbe                                                                   | `8081`                          |
| `healthChecks.livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe                                                                    | `30`                            |
| `healthChecks.livenessProbe.periodSeconds`        | Period seconds for livenessProbe                                                                           | `10`                            |
| `healthChecks.livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                                                                          | `5`                             |
| `healthChecks.livenessProbe.failureThreshold`     | Failure threshold for livenessProbe                                                                        | `5`                             |
| `healthChecks.livenessProbe.successThreshold`     | Success threshold for livenessProbe                                                                        | `1`                             |
| `autoscaling.enabled`                             | Enable autoscaling configuration for the deployment                                                        | `false`                         |
| `autoscaling.minReplicas`                         | Minimum number of replicas that the deployment can be scaled                                               | `1`                             |
| `autoscaling.maxReplicas`                         | Maximum number of replicas that the deployment can be scaled                                               | `2`                             |
| `autoscaling.behavior`                            | Configure separate scale-up and scale-down behaviors                                                       | `{}`                            |
| `autoscaling.metrics`                             | Configure autoscaling policies based on metrics                                                            | `{}`                            |
