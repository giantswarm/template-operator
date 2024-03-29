package controller

import (
	"github.com/giantswarm/k8sclient/v5/pkg/k8sclient"
	"github.com/giantswarm/microerror"
	"github.com/giantswarm/micrologger"
	"github.com/giantswarm/operatorkit/v5/pkg/controller"
	"github.com/giantswarm/operatorkit/v5/pkg/resource"
	"github.com/giantswarm/operatorkit/v5/pkg/resource/wrapper/metricsresource"
	"github.com/giantswarm/operatorkit/v5/pkg/resource/wrapper/retryresource"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"

	"github.com/giantswarm/template-operator/pkg/project"
	"github.com/giantswarm/template-operator/service/controller/handler/test"
)

type TODOConfig struct {
	K8sClient k8sclient.Interface
	Logger    micrologger.Logger
}

type TODO struct {
	*controller.Controller
}

func NewTODO(config TODOConfig) (*TODO, error) {
	var err error

	handlers, err := newTODOHandlers(config)
	if err != nil {
		return nil, microerror.Mask(err)
	}

	var operatorkitController *controller.Controller
	{
		c := controller.Config{
			K8sClient: config.K8sClient,
			Logger:    config.Logger,
			NewRuntimeObjectFunc: func() runtime.Object {
				return new(corev1.Pod)
			},
			Resources: handlers,

			// Name is used to compute finalizer names. This here results in something
			// like operatorkit.giantswarm.io/template-operator-todo-controller.
			Name: project.Name() + "-todo-controller",
		}

		operatorkitController, err = controller.New(c)
		if err != nil {
			return nil, microerror.Mask(err)
		}
	}

	c := &TODO{
		Controller: operatorkitController,
	}

	return c, nil
}

func newTODOHandlers(config TODOConfig) ([]resource.Interface, error) {
	var err error

	var testResource resource.Interface
	{
		c := test.Config{
			K8sClient: config.K8sClient,
			Logger:    config.Logger,
		}

		testResource, err = test.New(c)
		if err != nil {
			return nil, microerror.Mask(err)
		}
	}

	handlers := []resource.Interface{
		testResource,
	}

	{
		c := retryresource.WrapConfig{
			Logger: config.Logger,
		}

		handlers, err = retryresource.Wrap(handlers, c)
		if err != nil {
			return nil, microerror.Mask(err)
		}
	}

	{
		c := metricsresource.WrapConfig{}

		handlers, err = metricsresource.Wrap(handlers, c)
		if err != nil {
			return nil, microerror.Mask(err)
		}
	}

	return handlers, nil
}
