## Specify a version of Liferay DXP

To specify the version of Liferay DXP to supply a value for `image.tag`:

```yaml
image:
  tag: 2024.q3.13
```

OR on the command line:

```shell
helm upgrade -i liferay -n liferay-system --create-namespace liferay/liferay \
	--set image.tag=2024.q3.13
```
