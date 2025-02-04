# Awesome Walrus Template

Terraform module which deploys Sveltos on any kubernetes cluster.

## Usage

```hcl
module "sveltos" {
  source             = "./modules/sveltos"    # Path to the External-DNS module

  namespace_name     = "sveltos-system"       # The namespace where sveltos will be created
  helm_release_name  = "projectsveltos"       # The name of the Helm release.
  helm_chart_version = "0.44.3"               # The version of the Helm chart to be used.

  resources = {
    accessManager = {
      limits = {
        cpu    = "500m"
        memory = "256Mi"
      }
      requests = {
        cpu    = "10m"
        memory = "128Mi"
      }
    }
    addonController = {
      limits = {
        cpu    = "500m"
        memory = "512Mi"
      }
      requests = {
        cpu    = "250m"
        memory = "256Mi"
      }
    }
    classifierManager = {
      limits = {
        cpu    = "500m"
        memory = "256Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "128Mi"
      }
    }
    conversionWebhook = {
      limits = {
        cpu    = "500m"
        memory = "128Mi"
      }
      requests = {
        cpu    = "10m"
        memory = "64Mi"
      }
    }
    eventManager = {
      limits = {
        cpu    = "500m"
        memory = "256Mi"
      }
      requests = {
        cpu    = "10m"
        memory = "128Mi"
      }
    }
    hcManager = {
      limits = {
        cpu    = "500m"
        memory = "256Mi"
      }
      requests = {
        cpu    = "10m"
        memory = "128Mi"
      }
    }
    registerMgmtClusterJob = {
      limits = {
        cpu    = "500m"
        memory = "256Mi"
      }
      requests = {
        cpu    = "250m"
        memory = "128Mi"
      }
    }
    scManager = {
      limits = {
        cpu    = "500m"
        memory = "256Mi"
      }
      requests = {
        cpu    = "10m"
        memory = "128Mi"
      }
    }
    shardController = {
      limits = {
        cpu    = "500m"
        memory = "256Mi"
      }
      requests = {
        cpu    = "10m"
        memory = "128Mi"
      }
    }
  }
}
```

## Examples

- ...
- ...

## Contributing

Please read our [contributing guide](./docs/CONTRIBUTING.md) if you're interested in contributing to Walrus template.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.23.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | >= 1.5.7 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.23.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="kubernetes_manifest"></a> [kubernetes_manifest](#module\_kubernetes_manifest) | "github.com/cuemby-labs/infra-terraform-kubernetes-manifest?ref=v1.0.1" | v1.0.1 |

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.test](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/kubectl_manifest) | resource |
| [kubernetes_namespace.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [helm_release.example](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace_name"></a> [namespace_name](#input_namespace_name) | Namespace where helmchart will be installed. | string | "sveltos-system" | no |
| <a name="input_helm_release_name"></a> [helm_release_name](#input_helm_release_name) | Name for the Sveltos Helm release. | string | "projectsveltos" | no |
| <a name="input_helm_chart_version"></a> [helm_chart_version](#input_helm_chart_version) | Version of the Helm chart. | string | "0.44.3" | no |
| <a name="input_resources"></a> [resources](#input_resources) | Resource limits and requests for pods. | `map(object(string))` | `"See example"` | no |
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br><br>Examples:<pre>context:<br>  project:<br>    name: string<br>    id: string<br>  environment:<br>    name: string<br>    id: string<br>  resource:<br>    name: string<br>    id: string</pre> | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_submodule"></a> [submodule](#output\_submodule) | The message from submodule. |
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->

## License

Copyright (c) 2023 [Seal, Inc.](https://seal.io)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [LICENSE](./LICENSE) file for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
