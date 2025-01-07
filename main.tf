#
# Install CRDs
#

# module "kubernetes_manifest" {
#   depends_on = [kubernetes_namespace.sveltos]

#   source = "./modules/kubernetes_manifest"

#   manifests_urls = var.manifests_urls
# }

#
# Sveltos resources
#
data "kubernetes_namespace" "sveltos" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_namespace" "sveltos" {
  metadata {
    name = var.namespace_name
  }
  count = length(data.kubernetes_namespace.sveltos.id) == 0 ? 1 : 0
}

resource "helm_release" "sveltos" {
  depends_on = [kubernetes_namespace.sveltos]

  name       = "projectsveltos"
  repository = "https://projectsveltos.github.io/helm-charts"
  chart      = "projectsveltos"
  version    = var.chart_version
  namespace  = var.namespace_name

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      accessManager_request_memory          = var.resources["accessManager"]["requests"]["memory"],
      accessManager_limits_memory           = var.resources["accessManager"]["limits"]["memory"],
      accessManager_request_cpu             = var.resources["accessManager"]["requests"]["cpu"],
      accessManager_limits_cpu              = var.resources["accessManager"]["limits"]["cpu"],
      addonController_request_memory        = var.resources["addonController"]["requests"]["memory"],
      addonController_limits_memory         = var.resources["addonController"]["limits"]["memory"],
      addonController_request_cpu           = var.resources["addonController"]["requests"]["cpu"],
      addonController_limits_cpu            = var.resources["addonController"]["limits"]["cpu"],
      classifierManager_request_memory      = var.resources["classifierManager"]["requests"]["memory"],
      classifierManager_limits_memory       = var.resources["classifierManager"]["limits"]["memory"],
      classifierManager_request_cpu         = var.resources["classifierManager"]["requests"]["cpu"],
      classifierManager_limits_cpu          = var.resources["classifierManager"]["limits"]["cpu"],
      conversionWebhook_request_memory      = var.resources["conversionWebhook"]["requests"]["memory"],
      conversionWebhook_limits_memory       = var.resources["conversionWebhook"]["limits"]["memory"],
      conversionWebhook_request_cpu         = var.resources["conversionWebhook"]["requests"]["cpu"],
      conversionWebhook_limits_cpu          = var.resources["conversionWebhook"]["limits"]["cpu"],
      eventManager_request_memory           = var.resources["eventManager"]["requests"]["memory"],
      eventManager_limits_memory            = var.resources["eventManager"]["limits"]["memory"],
      eventManager_request_cpu              = var.resources["eventManager"]["requests"]["cpu"],
      eventManager_limits_cpu               = var.resources["eventManager"]["limits"]["cpu"],
      hcManager_request_memory              = var.resources["hcManager"]["requests"]["memory"],
      hcManager_limits_memory               = var.resources["hcManager"]["limits"]["memory"],
      hcManager_request_cpu                 = var.resources["hcManager"]["requests"]["cpu"],
      hcManager_limits_cpu                  = var.resources["hcManager"]["limits"]["cpu"],
      registerMgmtClusterJob_request_memory = var.resources["registerMgmtClusterJob"]["requests"]["memory"],
      registerMgmtClusterJob_limits_memory  = var.resources["registerMgmtClusterJob"]["limits"]["memory"],
      registerMgmtClusterJob_request_cpu    = var.resources["registerMgmtClusterJob"]["requests"]["cpu"],
      registerMgmtClusterJob_limits_cpu     = var.resources["registerMgmtClusterJob"]["limits"]["cpu"],
      scManager_request_memory              = var.resources["scManager"]["requests"]["memory"],
      scManager_limits_memory               = var.resources["scManager"]["limits"]["memory"],
      scManager_request_cpu                 = var.resources["scManager"]["requests"]["cpu"],
      scManager_limits_cpu                  = var.resources["scManager"]["limits"]["cpu"],
      shardController_request_memory        = var.resources["shardController"]["requests"]["memory"],
      shardController_limits_memory         = var.resources["shardController"]["limits"]["memory"],
      shardController_request_cpu           = var.resources["shardController"]["requests"]["cpu"],
      shardController_limits_cpu            = var.resources["shardController"]["limits"]["cpu"],
    })
  ]
}


resource "helm_release" "sveltos_dashboard" {
  depends_on = [kubernetes_namespace.sveltos]

  name       = "sveltos-dashboard"
  repository = "https://github.com/projectsveltos/dashboard-helm-chart"
  chart      = "dashboard"
  version    = var.dashboard_chart_version
  namespace  = var.namespace_name

  values = [
    templatefile("${path.module}/dashboard_values.yaml.tpl", {
      class_name                      = var.class_name,
      domain_name                     = var.domain_name,
      dash_domain_name                = local.dash_domain_name,
      issuer_name                     = var.issuer_name,
      issuer_kind                     = var.issuer_kind,
      uiBackendManager_request_memory = var.resources["uiBackendManager"]["requests"]["memory"],
      uiBackendManager_limits_memory  = var.resources["uiBackendManager"]["limits"]["memory"],
      uiBackendManager_request_cpu    = var.resources["uiBackendManager"]["requests"]["cpu"],
      uiBackendManager_limits_cpu     = var.resources["uiBackendManager"]["limits"]["cpu"],
    })
  ]
}

#
# Walrus Information
#

locals {
  context          = var.context
  dash_domain_name = replace(var.domain_name, ".", "-")
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}