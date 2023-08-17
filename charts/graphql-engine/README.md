# GraphQL Engine Helm Chart

This chart deploys the GraphQL Engine service with a Postgres instance for metadata storage.

## Prerequisites

1. Kubernetes 1.16+
2. Helm (preferably v3) installed – instructions are [here](https://helm.sh/docs/intro/install/).
3. Hasura helm repo configured.
  
```bash
helm repo add hasura https://hasura.github.io/helm-charts
```

## Get Started

### Install Helm Chart

```bash
helm install [RELEASE_NAME] hasura/graphql-engine
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

| Name                      | Description                                            | Value                 |
| ------------------------- | ------------------------------------------------------ | --------------------- |
| `global.imageRegistry`    | Global Docker image registry                           | `""`                  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array        | `[]`                  |
| `global.prefixOverride`   | Override the naming prefix instead of the release name | `{{ .Release.Name }}` |

### Common parameters

| Name                                              | Description                                                                                               | Value                   |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ----------------------- |
| `nameOverride`                                    | String to override the deployment name                                                                    | `""`                    |
| `namespaceOverride`                               | String to override the namespace                                                                          | `""`                    |
| `disableAnnotationTimestamp`                      | Disable the current timestamp annotation that force the pod to roll out                                   | `true`                  |
| `labels`                                          | Add labels to the deployment resource                                                                     | `{}`                    |
| `annotations`                                     | Add annotations to the deployment resource                                                                | `{}`                    |
| `command`                                         | Customize the execution command                                                                           | `[]`                    |
| `args`                                            | Customize execution arguments                                                                             | `[]`                    |
| `replicas`                                        | Number of pod replicas                                                                                    | `1`                     |
| `image.registry`                                  | GraphQL Data Connector image registry                                                                     | `docker.io`             |
| `image.repository`                                | GraphQL Data Connector image repository                                                                   | `hasura/graphql-engine` |
| `image.tag`                                       | GraphQL Data Connector image tag                                                                          | `v2.29.0`               |
| `image.pullPolicy`                                | GraphQL Data Connector image pull policy                                                                  | `IfNotPresent`          |
| `image.pullSecrets`                               | Specify image pull secrets                                                                                | `[]`                    |
| `affinity`                                        | Affinity for GraphQL Data Connector pod assignment                                                        | `{}`                    |
| `nodeSelector`                                    | Node labels for GraphQL Data Connector pod assignment                                                     | `{}`                    |
| `tolerations`                                     | Tolerations for GraphQL Data Connector pod assignment                                                     | `{}`                    |
| `securityContext`                                 | Define privilege and access control settings for a Pod or Container                                       | `{}`                    |
| `initContainers`                                  | Additional initialization containers                                                                      | `[]`                    |
| `extraContainers`                                 | Optionally specify extra list of additional containers for the GraphQL Data Connector pod                 | `[]`                    |
| `extraVolumes`                                    | Optionally specify extra list of additional volumes for the GraphQL Data Connector pod                    | `[]`                    |
| `extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the GraphQL Data Connector container         | `[]`                    |
| `extraEnvs`                                       | Optionally specify extra list of additional environment variables for the pod                             | `[]`                    |
| `extraEnvsTpl`                                    | Optionally specify extra list of additional environment variables for the pod, using text template        | `""`                    |
| `resources`                                       | Resource requests and limits of GraphQL Data Connector container                                          | `{}`                    |
| `serviceAccount.enabled`                          | Enable ServiceAccount for GraphQL Data Connector pod                                                      | `false`                 |
| `serviceAccount.name`                             | The name of the ServiceAccount to use                                                                     | `""`                    |
| `service.type`                                    | Kubernetes Service type of GraphQL Data Connector                                                         | `ClusterIP`             |
| `service.labels`                                  | Optionally specify labels for GraphQL Data Connector Service                                              | `{}`                    |
| `service.annotations`                             | Optionally specify annotations for GraphQL Data Connector Service                                         | `{}`                    |
| `healthChecks.enabled`                            | Enable health check for GraphQL Data Connector container                                                  | `false`                 |
| `healthChecks.readinessProbe.httpGet.path`        | The health check endpoint for readinessProbe                                                              | `/healthz`              |
| `healthChecks.readinessProbe.httpGet.port`        | The health check port for readinessProbe                                                                  | `8080`                  |
| `healthChecks.readinessProbe.initialDelaySeconds` |                                                                                                           | `5`                     |
| `healthChecks.readinessProbe.periodSeconds`       | Period seconds for readinessProbe                                                                         | `10`                    |
| `healthChecks.readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe                                                                        | `5`                     |
| `healthChecks.readinessProbe.failureThreshold`    | Failure threshold for readinessProbe                                                                      | `5`                     |
| `healthChecks.readinessProbe.successThreshold`    | Success threshold for readinessProbe                                                                      | `1`                     |
| `healthChecks.livenessProbe.httpGet.path`         | The health check endpoint for livenessProbe (You need to change the data source that you will connect to) | `/healthz`              |
| `healthChecks.livenessProbe.httpGet.port`         | The health check port for readinessProbe                                                                  | `8080`                  |
| `healthChecks.livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe                                                                   | `30`                    |
| `healthChecks.livenessProbe.periodSeconds`        | Period seconds for livenessProbe                                                                          | `10`                    |
| `healthChecks.livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                                                                         | `5`                     |
| `healthChecks.livenessProbe.failureThreshold`     | Failure threshold for livenessProbe                                                                       | `5`                     |
| `healthChecks.livenessProbe.successThreshold`     | Success threshold for livenessProbe                                                                       | `1`                     |
| `autoscaling.enabled`                             | Enable autoscaling configuration for the deployment                                                       | `false`                 |
| `autoscaling.minReplicas`                         | Minimum number of replicas that the deployment can be scaled                                              | `1`                     |
| `autoscaling.maxReplicas`                         | Maximum number of replicas that the deployment can be scaled                                              | `2`                     |
| `autoscaling.behavior`                            | Configure separate scale-up and scale-down behaviors                                                      | `{}`                    |
| `autoscaling.metrics`                             | Configure autoscaling policies based on metrics                                                           | `{}`                    |
| `ingress.enabled`                                 | Enable ingress configuration for the graphql-engine service                                               | `false`                 |
| `ingress.annotations`                             | Optionally specify additional annotations to the ingress resource                                         | `{}`                    |
| `ingress.ingressClassName`                        | Specify the ingress class name for the graphql-engine service                                             | `false`                 |
| `ingress.hostName`                                | The ingress host name for the graphql-engine service                                                      | `""`                    |
| `ingress.path`                                    | The path suffix, only set if you only want to expose specific api endpoints                               | `""`                    |
| `ingress.serviceName`                             | String to override the target service name                                                                | `""`                    |
| `ingress.servicePort`                             | String to override the target service port                                                                | `""`                    |
| `ingress.tls`                                     | Optionally specify TLS configuration for the ingress service                                              | `{}`                    |

### Configuration parameters

| Name                                 | Description                                                                                                        | Value                                        |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | -------------------------------------------- |
| `config.name`                        | String to override the configmap name                                                                              | `{{ .Release.Name }}-graphql-engine-configs` |
| `config.port`                        | Specify the container port of GraphQL Engine pods                                                                  | `8080`                                       |
| `config.metadataOnly`                | Use the PostgreSQL helm chart for metadata storage only (Only takes effect when `@secret.metadataDbUrl` isn't set) | `true`                                       |
| `config.authHook`                    | Optionally specify the authorization hook URL for GraphQL Engine pods                                              | `""`                                         |
| `config.authHookMode`                | Optionally specify the HTTP method used by Hasura to make requests if you're using the webhook for authentication  | `GET`                                        |
| `config.unauthorizedRole`            | The role for unauthenticated (non-logged in) users                                                                 | `""`                                         |
| `config.enableConsole`               | Enable the Hasura Console                                                                                          | `true`                                       |
| `config.corsDomains`                 | List of domains to allow CORS. Separated by commas                                                                 | `*`                                          |
| `config.devMode`                     | Enable the dev mode for GraphQL requests                                                                           | `false`                                      |
| `config.enableInternalConsoleAssets` | Use whether Hasura CDN or the internal path for console assets                                                     | `false`                                      |
| `config.enabledLogTypes`             | List of enabled log types                                                                                          | `""`                                         |
| `config.enabledApis`                 | List of enabled APIs for GraphQL Engine                                                                            | `""`                                         |
| `config.lux.proEndpoint`             | The base host URL for Hasura Enterprise Classic to authorize with self-host Lux control plane (Enterprise Classic) | `""`                                         |
| `config.lux.proEndpoint`             | The base host URL for Hasura Enterprise Classic to authorize with self-host Lux control plane (Enterprise Classic) | `""`                                         |
| `config.lux.disableLogSender`        | Disable sending observability logs to Lux (Enterprise Classic)                                                     | `false`                                      |
| `config.extraConfigs`                | Extra dictionary configs that are added to both Configmap and container env                                        | `{}`                                         |

### Secret parameters

| Name                   | Description                                                                          | Value                                        |
| ---------------------- | ------------------------------------------------------------------------------------ | -------------------------------------------- |
| `secret.enabled`       | Automatically generate a secret resource                                             | `true`                                       |
| `secret.name`          | Optionally specify your secret name                                                  | `{{ .Release.Name }}-graphql-engine-secrets` |
| `secret.eeLicenseKey`  | String to enable the Enterprise Edition with the license key (EE)                    | `""`                                         |
| `secret.proKey`        | String to enable the Enterprise Classic edition (EE)                                 | `""`                                         |
| `secret.metadataDbUrl` | The connection string to the metadata database                                       | `""`                                         |
| `secret.adminSecret`   | The admin secret of GraphQL Engine                                                   | `""`                                         |
| `secret.adminSecrets`  | Optionally specify a list of admin secrets (EE)                                      | `[]`                                         |
| `secret.metricsSecret` | Prometheus metrics secret (EE)                                                       | `""`                                         |
| `secret.jwtSecret`     | Specify the secret to enables Authentication using JWT                               | `""`                                         |
| `secret.jwtSecrets`    | Optionally specify a list of secrets to enables Authentication using JWT (EE)        | `""`                                         |
| `secret.redisUrl`      | The connection string to the redis database for caching (EE)                         | `""`                                         |
| `secret.redisUrl`      | The connection string to the redis database for rate limit (EE)                      | `""`                                         |
| `secret.ssoProviders`  | Optionally specify the list of Identity provider settings for console SSO login (EE) | `[]`                                         |
| `secret.extraSecrets`  | Extra secrets data for graphql-engine environment variables (EE)                     | `{}`                                         |

### Postgres parameters

See the [PostgreSQL helm chart](../postgres) for full list of parameters. 

| Name               | Description                      | Value  |
| ------------------ | -------------------------------- | ------ |
| `postgres.enabled` | Enable the PostgreSQL helm chart | `true` |

### Other parameters

| Name                       | Description                                                                                                                                          | Value   |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `podMonitor.enabled`       | Enable the Prometheus PodMonitor resource. Require [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator) to be installed | `false` |
| `podMonitor.interval`      | The monitor scrape interval                                                                                                                          | `15s`   |
| `podMonitor.scrapeTimeout` | The monitor scrape timeout                                                                                                                           | `10s`   |

