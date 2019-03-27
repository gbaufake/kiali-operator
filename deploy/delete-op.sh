#!/bin/sh

oc delete -n kiali-operator -f operator.yaml
oc delete -n kiali-operator -f role_binding.yaml
oc delete -n kiali-operator -f role.yaml
oc delete -n kiali-operator -f service_account.yaml
oc delete -n kiali-operator -f crds/op_v1alpha1_kiali_crd.yaml
oc delete namespace kiali-operator
