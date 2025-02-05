## Adding Container Scripts

As described in the Liferay documentation you can [add scripts to the container](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/using-liferay-docker-images/running-scripts-in-containers) to be executed at various times in the lifecycle of the container.

To achieve this use the following construct:

```yaml
configmap:
  data:
    010_my_script.sh: |
      #!/bin/bash

      echo "Hello World!"

volumeMounts:
  - mountPath: /usr/local/liferay/scripts/pre-configure/010_my_script.sh
    name: liferay-file-resources
    subPath: 010_my_script.sh
    readOnly: true
```
