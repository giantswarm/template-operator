module github.com/giantswarm/template-operator

go 1.14

require (
	github.com/giantswarm/exporterkit v0.2.0
	github.com/giantswarm/k8sclient/v3 v3.1.0
	github.com/giantswarm/microendpoint v0.2.0
	github.com/giantswarm/microerror v0.2.0
	github.com/giantswarm/microkit v0.2.1
	github.com/giantswarm/micrologger v0.3.1
	github.com/giantswarm/operatorkit v1.0.0
	github.com/gorilla/mux v1.7.4 // indirect
	github.com/prometheus/client_golang v1.3.0
	github.com/spf13/cobra v0.0.6 // indirect
	github.com/spf13/viper v1.6.2
	k8s.io/api v0.16.6
	k8s.io/apimachinery v0.16.6
	k8s.io/client-go v0.16.6
)

replace (
	k8s.io/api v0.0.0 => k8s.io/api v0.16.6
	k8s.io/apiextensions-apiserver v0.0.0 => k8s.io/apiextensions-apiserver v0.16.6
	k8s.io/apimachinery v0.0.0 => k8s.io/apimachinery v0.16.6
	k8s.io/apiserver v0.0.0 => k8s.io/apiserver v0.16.6
	k8s.io/cli-runtime v0.0.0 => k8s.io/cli-runtime v0.16.6
	k8s.io/client-go v0.0.0 => k8s.io/client-go v0.16.6
	k8s.io/cloud-provider v0.0.0 => k8s.io/cloud-provider v0.16.6
	k8s.io/cluster-bootstrap v0.0.0 => k8s.io/cluster-bootstrap v0.16.6
	k8s.io/code-generator v0.0.0 => k8s.io/code-generator v0.16.6
	k8s.io/component-base v0.0.0 => k8s.io/component-base v0.16.6
	k8s.io/cri-api v0.0.0 => k8s.io/cri-api v0.16.6
	k8s.io/csi-translation-lib v0.0.0 => k8s.io/csi-translation-lib v0.16.6
	k8s.io/kube-aggregator v0.0.0 => k8s.io/kube-aggregator v0.16.6
	k8s.io/kube-controller-manager v0.0.0 => k8s.io/kube-controller-manager v0.16.6
	k8s.io/kube-proxy v0.0.0 => k8s.io/kube-proxy v0.16.6
	k8s.io/kube-scheduler v0.0.0 => k8s.io/kube-scheduler v0.16.6
	k8s.io/kubectl v0.0.0 => k8s.io/kubectl v0.16.6
	k8s.io/kubelet v0.0.0 => k8s.io/kubelet v0.16.6
	k8s.io/legacy-cloud-providers v0.0.0 => k8s.io/legacy-cloud-providers v0.16.6
	k8s.io/metrics v0.0.0 => k8s.io/metrics v0.16.6
	k8s.io/sample-apiserver v0.0.0 => k8s.io/sample-apiserver v0.16.6
	k8s.io/utils v0.0.0 => k8s.io/utils v0.0.0-20191114200735-6ca3b61696b6
)
