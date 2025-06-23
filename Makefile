.PHONY: create update upload build

VERSION := 1.0.0
MODULE_NAME := my-apps-module
ORG_PUBLIC_NAMESPACE := bashar-prod

create:
	viam module create --name=${MODULE_NAME} --public-namespace=${ORG_PUBLIC_NAMESPACE}

update:
	viam module update --module=meta.json

upload: build
	viam module upload --version=${VERSION} --platform=any --public-namespace=${ORG_PUBLIC_NAMESPACE} module

build:
	cd src/blue && npm run build
	cd src/red && npm run build
