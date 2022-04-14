# Helm chart for Paperless-ngx

Paperless-ngx is a document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper.

[Overview of Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx)

## TL;DR

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-release bitnami/postgresql
```

## Introduction

This chart installs a [Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

You can choose to install [Redis](https://redis.io/) and [PostgreSQL](http://www.postgresql.org) with this chart or use your own installation.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure


## Installing the Chart

To install the chart with the release name `my-release`:

```bash
helm install my-release bitnami/postgresql
```

The command deploys Paperless-ngx on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

## Parameters

### Global parameters

| Name                                         | Description                                                                                 | Value |
| -------------------------------------------- | ------------------------------------------------------------------------------------------- | ----- |
| `global.storageClass`                       | Global StorageClass for Persistent Volume(s)| `""`  |

### Redis parameters
If redis.enabled is set to **true** installs redis from https://github.com/bitnami/charts/tree/master/bitnami/redis with all supported options. By default this chart installs [Redis](https://redis.io/) in 'standalone' mode
| Name                                         | Description                                                                                 | Value |
| -------------------------------------------- | ------------------------------------------------------------------------------------------- | ----- |
| `redis.enabled`                       | Install redis or not| `true`  |
| `redis.fullnameOverride`                    | String to fully override fullname | `paperless-ngx-redis`|
| `redis.architecture`                        | Redis&trade; architecture. Allowed values: `standalone` or `replication`| `standalone`|

### PostgreSQL parameters
If postgresql.enabled is set to **true** installs postgresql from https://github.com/bitnami/charts/tree/master/bitnami/postgresql with all supported options. By default this chart installs [PostgreSQL](http://www.postgresql.org) without replication or HA.
| Name                                         | Description                                                                                 | Value |
| -------------------------------------------- | ------------------------------------------------------------------------------------------- | ----- |
| `postgresql.enabled`                       | Install postgresql or not| `true`  |
| `postgresql.fullnameOverride`              | String to fully override fullname                         | `paperless-ngx-postgresql`|
| `postgresql.auth.existingSecret`           | Name of existing secret to use for PostgreSQL credentials | `postgres-password`|
| `postgresql.auth.username`                 | Name for a custom user to create| `paperless-ngx` |
| `postgresql.auth.database`                 | Name for a custom database to create | `paperless-ngx` |