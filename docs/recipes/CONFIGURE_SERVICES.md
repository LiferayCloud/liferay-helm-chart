## Configure Services

Services can be configured as follows:

```yaml
database:
  config:
    database: <database>
    host: <host>
    parameters: <connection_string_parameters>
    password: <password>
    port: <port>
    user: <username>

objectstorage:
  config:
    user: <username>
    password: <password>
    buckets: <bucket_name>
    host: <host>
    region: <region>
    scheme: <scheme>
    pathStyle: <true|false>
    ports:
      api: <api_port>

search:
  config:
    clusterName: <cluster_name>
    host: <host>
    password: <password>
    port: <port>
    user: <username>
```
