.PHONY: create update upload

BASE_URL := https://pr-8211-appmain-bplesliplq-uc.a.run.app/
VERSION := 0.0.0
ORG_PUBLIC_NAMESPACE := bashar

create:
	viam --base-url ${BASE_URL} module create --name=test-module --public-namespace=${ORG_PUBLIC_NAMESPACE}

update:
	viam --base-url ${BASE_URL} module update --module=meta.json

upload:
	viam --base-url ${BASE_URL} module upload --version=${VERSION} --platform=any --public-namespace=${ORG_PUBLIC_NAMESPACE} --force module

