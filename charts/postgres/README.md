# PostgreSQL Helm Chart

This chart deploys a PostgreSQL instance for metadata storage.

> **Disclaimer**: The PostgreSQL helm chart is mainly used for GraphQL Engine metadata storage that doesn't support Read replicas. We recommend using advanced PostgreSQL helm charts such as [Bitnami](https://bitnami.com/stack/postgresql/helm) for data source connections.

## Prerequisites

1. Helm (preferably v3) installed – instructions are [here](https://helm.sh/docs/intro/install/).
2. Hasura helm repo configured.
  
## Parameters 

### Global parameters

| Name                      | Description                                            | Value                 |
| ------------------------- | ------------------------------------------------------ | --------------------- |
| `global.imageRegistry`    | Global Docker image registry                           | `""`                  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array        | `[]`                  |
| `global.prefixOverride`   | Override the naming prefix instead of the release name | `{{ .Release.Name }}` |

### PostgreSQL parameters

| Name                          | Description                                                                             | Value               |
| ----------------------------- | --------------------------------------------------------------------------------------- | ------------------- |
| `nameOverride`                | String to override the deployment name                                                  | `""`                |
| `namespaceOverride`           | String to override the namespace                                                        | `""`                |
| `labels`                      | Add labels to the deployment resource                                                   | `{}`                |
| `annotations`                 | Add annotations to the deployment resource                                              | `{}`                |
| `command`                     | Customize the execution command                                                         | `[]`                |
| `args`                        | Customize execution arguments                                                           | `[]`                |
| `image.registry`              | PostgreSQL image registry                                                               | `docker.io`         |
| `image.repository`            | PostgreSQL image repository                                                             | `postgres`          |
| `image.tag`                   | PostgreSQL image tag                                                                    | `15`                |
| `image.pullPolicy`            | PostgreSQL image pull policy                                                            | `IfNotPresent`      |
| `image.pullSecrets`           | Specify image pull secrets                                                              | `[]`                |
| `auth.username`               | Name for a custom user to create                                                        | `""`                |
| `auth.password`               | Password for the custom user to create.                                                 | `""`                |
| `auth.database`               | Name for a custom database to create                                                    | `""`                |
| `persistence.enabled`         | Enable PostgreSQL data persistence using PVC                                            | `true`              |
| `persistence.existingClaim`   | Name of an existing PVC to use                                                          | `""`                |
| `persistence.storageClass`    | PVC Storage Class for PostgreSQL data volume                                            | `""`                |
| `persistence.accessModes`     | PVC Access Mode for PostgreSQL volume                                                   | `["ReadWriteOnce"]` |
| `persistence.size`            | PVC Storage Request for PostgreSQL volume                                               | `10Gi`              |
| `persistence.annotations`     | Annotations for the PVC                                                                 | `{}`                |
| `persistence.labels`          | Labels for the PVC                                                                      | `{}`                |
| `persistence.selector`        | Selector to match an existing Persistent Volume (this value is evaluated as a template) | `{}`                |
| `persistence.dataSource`      | Custom PVC data source                                                                  | `{}`                |
| `initdb.scripts`              | Dictionary of initialization scripts                                                    | `{}`                |
| `affinity`                    | Affinity for PostgreSQL pod assignment                                                  | `{}`                |
| `nodeSelector`                | Node labels for PostgreSQL pod assignment                                               | `{}`                |
| `tolerations`                 | Tolerations for PostgreSQL pod assignment                                               | `{}`                |
| `securityContext`             | Define privilege and access control settings for a Pod or Container                     | `{}`                |
| `initContainers`              | Additional initialization containers                                                    | `[]`                |
| `extraContainers`             | Optionally specify extra list of additional containers for the PostgreSQL pod           | `[]`                |
| `extraVolumes`                | Optionally specify extra list of additional volumes for the PostgreSQL pod              | `[]`                |
| `extraVolumeMounts`           | Optionally specify extra list of additional volumeMounts for the PostgreSQL container   | `[]`                |
| `resources`                   | Resource requests and limits of PostgreSQL container                                    | `{}`                |
| `serviceAccount.enabled`      | Enable ServiceAccount for PostgreSQL pod                                                | `false`             |
| `serviceAccount.name`         | The name of the ServiceAccount to use                                                   | `""`                |
| `service.type`                | Kubernetes Service type of PostgreSQL                                                   | `ClusterIP`         |
| `service.labels`              | Optionally specify labels for PostgreSQL Service                                        | `{}`                |
| `service.annotations`         | Optionally specify annotations for PostgreSQL Service                                   | `{}`                |
| `healthChecks.enabled`        | Enable health check for PostgreSQL container                                            | `false`             |
| `healthChecks.readinessProbe` | Enable readinessProbe configuration for PostgreSQL container                            | `{}`                |
| `healthChecks.livenessProbe`  | Enable livenessProbe configuration for PostgreSQL container                             | `{}`                |