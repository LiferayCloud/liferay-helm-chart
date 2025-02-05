## For Local Development

Use this approach when you want to deploy Liferay DXP into a local Kubernetes cluster so you can use and explore the features of DXP in a cloud native configuration.

Required tools:

- Kubectl (recommend `brew install kubernetes-cli`)
- Helm (recommend `brew install helm`)
- K3d (recommend `brew install k3d`)
- Stern (recommend `brew install stern`)

#### Setup a local Kubernetes cluster

The simplest and most comprehensive approach is to use K3d because it supports built-in ingress and seamlessly integrates with Docker's hostname resolution for addresses with the suffix `*.docker.localhost`. (not tested on MacOS or Windows yet)

```shell
k3d cluster create playground -p "80:80@loadbalancer"
```

#### Install the Chart

It is recommended to install the chart into a custom namespace. In this document the namespace used is `liferay-system`.

```shell
helm upgrade -i liferay -n liferay-system --create-namespace liferay/liferay
```

_The chart can also be installed from a local clone of the repository_:

```shell
git clone https://github.com/LiferayCloud/liferay-helm-chart.git
cd liferay-helm-chart
helm upgrade -i liferay -n liferay-system --create-namespace .
```

**Note:** By default the chart will use the `liferay/dxp:latest` docker image.

#### How to Gain Access

If the value `ingress.enabled` is `true` there should be 3 preset addresses available:

- DXP: http://main.dxp.docker.localhost

  The default user name and password are `test@main.dxp.docker.localhost` : `test`.

- Object Storage (MinIO Server - S3):

  - Console: http://console.objectstorage.docker.localhost
  - API: http://console.objectstorage.docker.localhost

  The default user name and password are `objectstorage` : `objectstorage`.

#### Basic Observation of the Chart

If you want to watch the progress of the chart the following simple command works well:

```shell
watch -n .5 kubectl get -n liferay-system all,svc,cm,pvc,ingress
```

As resources come, go and update their status the output will adjust accordingly.

#### Additional Virtual Hosts

If you create additional virtual instances in DXP select a hostname deriving from `*.dxp.docker.localhost` and specify that value for each of **WebId**, **Virtual Host** and **Mail Domain**. Once the Virtual Instance is created that host should be reachable without further action.

e.g. create a new host using:

- **WebId**: `two.dxp.docker.localhost`
- **Virtual Host**: `two.dxp.docker.localhost`
- **Mail Domain**: `two.dxp.docker.localhost`
- Wait for completion then access the virtual instance at http://two.dxp.docker.localhost

### [Recipes](RECIPES.md)
