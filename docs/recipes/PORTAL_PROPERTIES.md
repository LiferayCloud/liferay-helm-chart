## Portal Properties

While you can pass a few parameters as above there are so many properties to configure Liferay DXP that this would become a painful modeling problem.

So, it is possible to pass `portal.properties` style configuration by using the following construct:

```yaml
configmap:
  data:
    portal-custom.properties: |
      #
      # Include any portal properties contents here preserving indentation.
      # This file will be mounted into the container and is already configured
      # to be read by Liferay DXP.
      #

      foo=bar
```
