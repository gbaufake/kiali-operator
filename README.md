Create skeleton via:

```
operator-sdk new kiali-operator --api-version=op.kiali.io/v1alpha1 --kind=Kiali --type=ansible --skip-git-init
```

Build the operator image via:

```
operator-sdk build kiali/kiali-operator:0.1
```

