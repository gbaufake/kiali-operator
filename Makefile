OPERATOR_IMAGE ?= kiali/kiali-operator:latest


operator-build:
	@echo Building operator
	operator-sdk build ${OPERATOR_IMAGE}
	docker push ${OPERATOR_IMAGE}

operator-deploy-openshift: operator-remove-openshift
	@echo Deploying Operator
	oc new-project kiali-operator
	oc apply -n kiali-operator -f crds/op_v1alpha1_kiali_crd.yaml
	oc apply -n kiali-operator -f service_account.yaml
	oc apply -n kiali-operator -f role.yaml
	oc apply -n kiali-operator -f role_binding.yaml
	oc apply -n kiali-operator -f operator.yaml

operator-remove-openshift:
	@echo Removing Operator
	oc delete --ignore-not-found=true -n kiali-operator -f crds/op_v1alpha1_kiali_crd.yaml
	oc delete --ignore-not-found=true -n kiali-operator -f service_account.yaml
	oc delete --ignore-not-found=true -n kiali-operator -f role.yaml
	oc delete --ignore-not-found=true -n kiali-operator -f role_binding.yaml
	oc delete --ignore-not-found=true -n kiali-operator -f operator.yaml
	oc delete namespace kiali-test-mesh-operator --ignore-not-found=true

deploy-kiali:
	@echo Deploy Kiali CR
	oc apply -n kiali-operator -f crds/op_v1alpha1_kiali_cr.yaml


remove-kiali: 
	@echo Remove Kiali CR
	oc delete --ignore-not-found=true -n kiali-operator -f crds/op_v1alpha1_kiali_cr.yaml
