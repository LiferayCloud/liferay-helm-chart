## Adding a License

When going to production a DXP license is required. To add a license do your Liferay helm deployment use the following recipe.

Edit your production `values.yaml` file and add the following construct:

#### From the default Liferay ConfigMap

```yaml
configmap:
  data:
	# Adds a data entry to Liferay's ConfigMap.
    license.xml: |
      <?xml version="1.0"?>

      <license>
        ...
      </license>
env:
  # Removes the trial license bundled with the Liferay DXP image.
  - name: LIFERAY_DISABLE_TRIAL_LICENSE
    value: "true"
volumeMounts:
  # Mount the license file into the container referring to the ConfigMap data entry above.
  - mountPath: /etc/liferay/mount/files/deploy/license.xml
    name: liferay-file-resources
    subPath: license.xml
```

#### From a Secret

```yaml
env:
  # Removes the trial license bundled with the Liferay DXP image.
  - name: LIFERAY_DISABLE_TRIAL_LICENSE
    value: "true"
volumes:
  - name: liferay-license
    secret:
      secretName: the-liferay-license-secret
volumeMounts:
  # Mount the license file into the container referring to the ConfigMap data entry above.
  - mountPath: /etc/liferay/mount/files/deploy/license.xml
    name: liferay-license
    subPath: license.xml # refers to the data entry in the Secret
```
