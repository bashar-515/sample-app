.PHONY: create update upload build

VERSION := 0.0.2
MODULE_NAME := my-custom-app-module
STAGING_ORG_PUBLIC_NAMESPACE := bashar-prod
PROD_ORG_PUBLIC_NAMESPACE := bashar-dev
STAGING_BASE_URL := app.viam.dev
PROD_BASE_URL := app.viam.com

ORG_PUBLIC_NAMESPACE := ${STAGING_ORG_PUBLIC_NAMESPACE}
BASE_URL := ${PROD_BASE_URL}

create:
	viam --base-url ${BASE_URL} module create --name=${MODULE_NAME} --public-namespace=${ORG_PUBLIC_NAMESPACE}

update:
	viam --base-url ${BASE_URL} module update --module=meta.json

upload: build
	viam --base-url ${BASE_URL} module upload --version=${VERSION} --platform=any --public-namespace=${ORG_PUBLIC_NAMESPACE} module

build:
	cd src/blue && npm run build
	cd src/red && npm run build
