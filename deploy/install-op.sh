#!/bin/sh

oc new-project kiali-operator
oc apply -n kiali-operator -f crds/op_v1alpha1_kiali_crd.yaml
oc apply -n kiali-operator -f service_account.yaml
oc apply -n kiali-operator -f role.yaml
oc apply -n kiali-operator -f role_binding.yaml
oc apply -n kiali-operator -f operator.yaml
