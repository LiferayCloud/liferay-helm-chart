## For Production

When installing into production it is best to start by creating a custom values file.

`custom-values.yaml`:

```yaml
# Custom Values
config: {}
```

Once the file has all the necessary configuration it can be supplied to the helm command as follows:

```shell
helm upgrade -i liferay -n liferay-system --create-namespace liferay/liferay \
  -f custom-values.yaml
```

### [Recipes](RECIPES.md)
