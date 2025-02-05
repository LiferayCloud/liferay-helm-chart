## Scaling (Clustering)

Clustering is automatically configured when either static or auto scaling is enabled.

> _**Note:** A license which supports clustering must be deployed._

#### Static Scaling

Static scaling is enabled by specifying the number of replicas:

```yaml
replicaCount: X
```

#### Auto (or Elastic) Scaling

Auto scaling is enabled by specifying `autoscaling.enabled=true`.

```yaml
autoscaling:
  enabled: true
```
