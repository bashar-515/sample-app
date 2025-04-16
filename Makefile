.PHONY: create update upload

BASE_URL := https://pr-8211-appmain-bplesliplq-uc.a.run.app/
VERSION := 0.0.0
PUBLIC_NAMESPACE := app-org

create:
	viam --base-url ${BASE_URL} module create --name=my-apps-module --public-namespace=${PUBLIC_NAMESPACE}

update:
	viam --base-url ${BASE_URL} module update --module=meta.json

upload:
	viam --base-url ${BASE_URL} module upload --version=${VERSION} --platform=any --public-namespace=${PUBLIC_NAMESPACE} --force dist

