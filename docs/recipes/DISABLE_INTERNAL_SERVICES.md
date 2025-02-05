## Disable internal services

It is often necessary to disable the internally defined Database, Search and Object Storage services in order to use external implementations.

Disable the internal services as follows (each one can be individually disabled):

```yaml
postgres:
  internal:
    enabled: false
search:
  internal:
    enabled: false
s3:
  internal:
    enabled: false
```
