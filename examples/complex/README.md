# Complex Usage Example

This example is intended to show a standard use case for this module with a relatively high amount of complex customization.

## Executing Example Deployment

The following example is provided as guidance, but can also be used for integration testing:

* [complex](main.tf)

### Deploying Complex Example as Integration Test

The following commands will initialize and deploy the infrastructure for the complex example:

```SHELL
terraform -chdir=examples/complex init -reconfigure
terraform -chdir=examples/complex apply
```

### Destroying Complex Example After Integration Test

The following command will destroy any resources created while deploying the complex example:

```SHELL
terraform -chdir=examples/complex destroy
```
