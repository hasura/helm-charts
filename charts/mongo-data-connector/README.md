# GraphQL Data Connector Helm Chart

This chart deploys the GraphQL Data Connector service.

## Prerequisites

1. Helm (preferably v3) installed – instructions are [here](https://helm.sh/docs/intro/install/).
2. Hasura helm repo configured.
  
```bash
helm repo add hasura https://hasura.github.io/helm-charts
```

## Parameters 

| Name                                              | Description                                                                                     | Value                         |
| ------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------- |
| `global.imageRegistry`                            | Global Docker image registry                                                                    | `""`                          |
| `global.imagePullSecrets`                         | Global Docker registry secret names as an array                                                 | `[]`                          |
| `global.prefixOverride`                           | Override the naming prefix instead of the release name                                          | `{{ .Release.Name }}`         |
| `nameOverride`                                    | String to override the deployment name                                                          | `""`                          |
| `namespaceOverride`                               | String to override the namespace                                                                | `""`                          |
| `disableAnnotationTimestamp`                      | Disable the current timestamp annotation that force the pod to roll out                         | `true`                        |
| `labels`                                          | Add labels to the deployment resource                                                           | `{}`                          |
| `annotations`                                     | Add annotations to the deployment resource                                                      | `{}`                          |
| `command`                                         | Customize the execution command                                                                 | `[]`                          |
| `args`                                            | Customize execution arguments                                                                   | `[]`                          |
| `replicas`                                        | Number of pod replicas                                                                          | `1`                           |
| `image.registry`                                  | Mongo Data Connector image registry                                                             | `docker.io`                   |
| `image.repository`                                | Mongo Data Connector image repository                                                           | `hasura/mongo-data-connector` |
| `image.tag`                                       | Mongo Data Connector image tag                                                                  | `v2.29.0`                     |
| `image.pullPolicy`                                | Mongo Data Connector image pull policy                                                          | `IfNotPresent`                |
| `image.pullSecrets`                               | Specify image pull secrets                                                                      | `[]`                          |
| `affinity`                                        | Affinity for Mongo Data Connector pod assignment                                                | `{}`                          |
| `nodeSelector`                                    | Node labels for Mongo Data Connector pod assignment                                             | `{}`                          |
| `tolerations`                                     | Tolerations for Mongo Data Connector pod assignment                                             | `{}`                          |
| `securityContext`                                 | Define privilege and access control settings for a Pod or Container                             | `{}`                          |
| `initContainers`                                  | Additional initialization containers                                                            | `[]`                          |
| `extraContainers`                                 | Optionally specify extra list of additional containers for the Mongo Data Connector pod         | `[]`                          |
| `extraVolumes`                                    | Optionally specify extra list of additional volumes for the Mongo Data Connector pod            | `[]`                          |
| `extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Mongo Data Connector container | `[]`                          |
| `extraEnvs`                                       | Optionally specify extra list of additional environment variables for the pod                   | `[]`                          |
| `resources`                                       | Resource requests and limits of Mongo Data Connector container                                  | `{}`                          |
| `serviceAccount.enabled`                          | Enable ServiceAccount for Mongo Data Connector pod                                              | `false`                       |
| `serviceAccount.name`                             | The name of the ServiceAccount to use                                                           | `""`                          |
| `service.type`                                    | Kubernetes Service type of Mongo Data Connector                                                 | `ClusterIP`                   |
| `service.labels`                                  | Optionally specify labels for Mongo Data Connector Service                                      | `{}`                          |
| `service.annotations`                             | Optionally specify annotations for Mongo Data Connector Service                                 | `{}`                          |
| `healthChecks.enabled`                            | Enable health check for Mongo Data Connector container                                          | `true`                        |
| `healthChecks.readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe                                                        | `5`                           |
| `healthChecks.readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                                               | `10`                          |
| `healthChecks.readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                                              | `5`                           |
| `healthChecks.readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                                            | `5`                           |
| `healthChecks.readinessProbe.successThreshold`    | Success threshold for readinessProbe                                                            | `1`                           |
| `healthChecks.livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe                                                         | `30`                          |
| `healthChecks.livenessProbe.periodSeconds`        | Period seconds for livenessProbe                                                                | `10`                          |
| `healthChecks.livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                                                               | `5`                           |
| `healthChecks.livenessProbe.failureThreshold`     | Failure threshold for livenessProbe                                                             | `5`                           |
| `healthChecks.livenessProbe.successThreshold`     | Success threshold for livenessProbe                                                             | `1`                           |
| `autoscaling.enabled`                             | Enable autoscaling configuration for the deployment                                             | `false`                       |
| `autoscaling.minReplicas`                         | Minimum number of replicas that the deployment can be scaled                                    | `1`                           |
| `autoscaling.maxReplicas`                         | Maximum number of replicas that the deployment can be scaled                                    | `2`                           |
| `autoscaling.behavior`                            | Configure separate scale-up and scale-down behaviors                                            | `{}`                          |
| `autoscaling.metrics`                             | Configure autoscaling policies based on metrics                                                 | `{}`                          |
