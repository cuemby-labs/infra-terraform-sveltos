#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}

#
# CRDs Variables
#

# variable "manifests_urls" {
#   description = "URLs list from the raw manifests"
#   type        = string

#   default = "https://raw.githubusercontent.com/projectsveltos/sveltos/v0.41.0/manifest/crds/sveltos_crds.yaml"
# }

#
# Sveltos variables
#

variable "release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "projectsveltos"
}

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "sveltos-system"
}

variable "chart_version" {
  description = "The version of the Helm chart."
  type        = string
  default     = "0.44.3"
}

variable "resources" {
  description = "Resource limits and requests for Pods Helm release."
  type        = map(object({
    limits = object({
      cpu    = string
      memory = string
    })
    requests = object({
      cpu    = string
      memory = string
    })
  }))

  default = {
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