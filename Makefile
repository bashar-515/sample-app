.PHONY: create update upload

# BASE_URL := https://pr-8211-appmain-bplesliplq-uc.a.run.app/
VERSION := 0.0.0
MODULE_NAME := my-apps-module
ORG_PUBLIC_NAMESPACE := basharorg

create:
	# viam --base-url ${BASE_URL} module create --name=my-apps-module --public-namespace=${ORG_PUBLIC_NAMESPACE}
	viam module create --name=${MODULE_NAME} --public-namespace=${ORG_PUBLIC_NAMESPACE}

update:
	#viam --base-url ${BASE_URL} module update --module=meta.json
	viam module update --module=meta.json

upload: build
	# viam --base-url ${BASE_URL} module upload --version=${VERSION} --platform=any --public-namespace=${ORG_PUBLIC_NAMESPACE} --force module
	
	# 'force' flag is used to allow module to be uploaded without an entrypoint specified in the meta.json file
	viam module upload --version=${VERSION} --platform=any --public-namespace=${ORG_PUBLIC_NAMESPACE} --force module

build:
	cd src/blue && npm run build
	cd src/red && npm run build
