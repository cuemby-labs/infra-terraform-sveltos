dashboard:
  ingress:
    enabled: true
    className: ${class_name}
    annotations:
      ingress.kubernetes.io/proxy-body-size: "0"
      ingress.kubernetes.io/ssl-redirect: "true"
      nginx.ingress.kubernetes.io/proxy-body-size: "0"
      nginx.ingress.kubernetes.io/ssl-redirect: "true"
      cert-manager.io/issuer: ${issuer_name}
      cert-manager.io/issuer-kind: ${issuer_kind}
      cert-manager.io/issuer-group: cert-manager.k8s.cloudflare.com
      external-dns.alpha.kubernetes.io/cloudflare-proxied: "true"
    hosts:
      - host: dashboard-sveltos.${domain_name}
    className: nginx
    tls:
      - secretName: dashboard-sveltos-${dash_domain_name}
        hosts:
          - dashboard-sveltos.${domain_name}
uiBackendManager:
  manager:
    resources:
      limits:
        cpu: 500m
        memory: 128Mi
      requests:
        cpu: 10m
        memory: 64Mi