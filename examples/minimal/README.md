# Minimal Usage Example

This example is intended to show a standard use case for this module with the least amount of recommended customization.

## Executing Example Deployment

The following example is provided as guidance, but can also be used for integration testing:

* [minimal](main.tf)

### Deploying Complex Minimal as Integration Test

The following commands will initialize and deploy the infrastructure for the minimal example:

```SHELL
terraform -chdir=examples/minimal init -reconfigure
terraform -chdir=examples/minimal apply
```

### Destroying Minimal Example After Integration Test

The following command will destroy any resources created while deploying the minimal example:

```SHELL
terraform -chdir=examples/minimal destroy
```
