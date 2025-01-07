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

variable "dashboard_chart_version" {
  description = "The version of the Sveltos Dashboard Helm chart."
  type        = string
  default     = "0.44.0"
}

variable "domain_name" {
  type        = string
  description = "domain name for sveltos, e.g. 'dev.domainname.com'"
  default     = "dev.domainname.com"
}

variable "issuer_name" {
  type        = string
  description = "origin issuer name for annotation cert-manager.io/issuer:"
  default     = "origin-ca-issuer"
}

variable "issuer_kind" {
  type        = string
  description = "origin issuer kind for annotation cert-manager.io/issuer-kind:"
  default     = "ClusterOriginIssuer"
}

variable "class_name" {
  type        = string
  description = "Ingress className"
  default     = "nginx"
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
    uiBackendManager = {
      limits = {
        cpu    = "500m"
        memory = "128Mi"
      }
      requests = {
        cpu    = "10m"
        memory = "64Mi"
      }
    }
  }
}