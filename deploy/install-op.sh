#!/bin/sh

oc new-project kiali-operator
oc create -n kiali-operator -f service_account.yaml 
oc create -n kiali-operator -f role.yaml 
oc create -n kiali-operator -f role_binding.yaml 
oc create -n kiali-operator -f operator.yaml 
