.PHONY: create update upload

BASE_URL := https://pr-8211-appmain-bplesliplq-uc.a.run.app/
VERSION := 0.0.0

create:
	viam --base-url ${BASE_URL} module create --name=my-apps-module --public-namespace=bashar-org

update:
	viam --base-url ${BASE_URL} module update --module=meta.json

upload:
	viam --base-url ${BASE_URL} module upload --version=${VERSION} --platform=any --public-namespace=bashar-org --force dist

