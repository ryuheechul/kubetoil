# yqk8s

This command, [yqk8s](./yqk8s) reduces each resource to this format, `name[api]@namespace` so you can have a bird eye view of the rendered YAMLs before applying to Kubernetes.
```yaml
legends:
  - name: '.metadata.name'
  - api: '.apiVersion'
  - namespace: '.metadata.namespace' # empty if there's none
```

can be useful to:
- debug the permission issues
- know what's to install
- share the bird-eye view with others to discuss for an evaluation for a new tool!

## See it in action

Run `make`

example results

```
./bin/examine-flux-operator.sh | ../yqk8s
flux-operator[ServiceAccount.v1]@flux-system
---
fluxinstances.fluxcd.controlplane.io[CustomResourceDefinition.apiextensions.k8s.io/v1]@
---
fluxreports.fluxcd.controlplane.io[CustomResourceDefinition.apiextensions.k8s.io/v1]@
---
resourcesetinputproviders.fluxcd.controlplane.io[CustomResourceDefinition.apiextensions.k8s.io/v1]@
---
resourcesets.fluxcd.controlplane.io[CustomResourceDefinition.apiextensions.k8s.io/v1]@
---
flux-operator-edit[ClusterRole.rbac.authorization.k8s.io/v1]@
---
flux-operator-view[ClusterRole.rbac.authorization.k8s.io/v1]@
---
flux-operator[ClusterRoleBinding.rbac.authorization.k8s.io/v1]@
---
flux-operator[Service.v1]@flux-system
---
flux-operator[Deployment.apps/v1]@flux-system
```
