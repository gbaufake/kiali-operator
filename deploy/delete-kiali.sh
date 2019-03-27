#!/bin/sh

oc delete -n kiali-operator -f crds/op_v1alpha1_kiali_cr.yaml
