accessManager:
  resources:
    limits:
      cpu: ${accessManager_limits_cpu}
      memory: ${accessManager_limits_memory}
    requests:
      cpu: ${accessManager_request_cpu}
      memory: ${accessManager_request_memory}
addonController:
  controller:
    resources:
      limits:
        cpu: ${addonController_limits_cpu}
        memory: ${addonController_limits_memory}
      requests:
        cpu: ${addonController_request_cpu}
        memory: ${addonController_request_memory}
classifierManager:
  manager:
    resources:
      limits:
        cpu: ${classifierManager_limits_cpu}
        memory: ${classifierManager_limits_memory}
      requests:
        cpu: ${classifierManager_request_cpu}
        memory: ${classifierManager_request_memory}
conversionWebhook:
  sveltosWebhook:
    resources:
      limits:
        cpu: ${conversionWebhook_limits_cpu}
        memory: ${conversionWebhook_limits_memory}
      requests:
        cpu: ${conversionWebhook_request_cpu}
        memory: ${conversionWebhook_request_memory}
eventManager:
  manager:
    resources:
      limits:
        cpu: ${eventManager_limits_cpu}
        memory: ${eventManager_limits_memory}
      requests:
        cpu: ${eventManager_request_cpu}
        memory: ${eventManager_request_memory}
hcManager:
  manager:
    resources:
      limits:
        cpu: ${hcManager_limits_cpu}
        memory: ${hcManager_limits_memory}
      requests:
        cpu: ${hcManager_request_cpu}
        memory: ${hcManager_request_memory}
registerMgmtClusterJob:
  registerMgmtCluster:
    resources:
      limits:
        cpu: ${registerMgmtClusterJob_limits_cpu}
        memory: ${registerMgmtClusterJob_limits_memory}
      requests:
        cpu: ${registerMgmtClusterJob_request_cpu}
        memory: ${registerMgmtClusterJob_request_memory}
scManager:
  manager:
    resources:
      limits:
        cpu: ${scManager_limits_cpu}
        memory: ${scManager_limits_memory}
      requests:
        cpu: ${scManager_request_cpu}
        memory: ${scManager_request_memory}
shardController:
  manager:
    resources:
      limits:
        cpu: ${shardController_limits_cpu}
        memory: ${shardController_limits_memory}
      requests:
        cpu: ${shardController_request_cpu}
        memory: ${shardController_request_memory}