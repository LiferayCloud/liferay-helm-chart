## Helm

Helm has a huge number of commands and features. Here are a few examples that can be helpful.

### View Chart Values

To view the set of entire set of chart values the following command can be used:

```shell
helm show values liferay/liferay
```

### Uninstallation

If all you want to do is update the chart, simply execute the install instruction above.

However, to uninstall the chart simply do:

```shell
helm uninstall -n liferay-system liferay
```

### Starting from Scratch

Particularly in development mode, starting from scratch involves also removing all the storage volumes. This deletes the database storage, the object storage and the search engine storage

First uninstall the chart as above. Then remove all the persistent volumes (which destroys all the data):

```shell
k delete -n liferay-system pvc \
  liferay-database-pvc-liferay-database-0 \
  liferay-objectstorage-pvc-liferay-objectstorage-0 \
  liferay-search-pvc-liferay-search-0 \
  liferay-working-data-pvc-liferay-0
```
