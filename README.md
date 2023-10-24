# Terraform Azure Network Module by KWAZI

Terraform Module for Creating a Configurable Network Stack on Microsoft Azure

## Getting Started

TODO

## Need Help?

TODO

## Designing a Deployment

TODO

## Major Created Resources

TODO

## Executing Example Deployments

The following examples are provided as guidance, but can also be used for integration testing:

* [examples/complex](examples/complex/main.tf)
* [examples/minimal](examples/minimal/main.tf)

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

### Deploying Complex Minimal as Integration Test

The following commands will initialize and deploy the infrastructure for the minimal example:

```SHELL
terraform -chdir=examples/minimal init -reconfigure
terraform -chdir=examples/minimal apply
```

### Destroying Minimal Example After Integration Test

```SHELL
terraform -chdir=examples/minimal destroy
```

The following command will destroy any resources created while deploying the minimal example:
