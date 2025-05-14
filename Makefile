.PHONY: create update upload build

VERSION := 0.0.3
MODULE_NAME := my-apps-module
ORG_PUBLIC_NAMESPACE := basharorg

create:
	viam module create --name=${MODULE_NAME} --public-namespace=${ORG_PUBLIC_NAMESPACE}

update:
	viam module update --module=meta.json

upload: build
	# 'force' flag is used to allow module to be uploaded without an entrypoint specified in the meta.json file
	viam module upload --version=${VERSION} --platform=any --public-namespace=${ORG_PUBLIC_NAMESPACE} --force module

build:
	cd src/blue && npm run build
	cd src/red && npm run build
