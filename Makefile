DOCKER_NAMESPACE =	armbuild/
NAME =			ocs-app-ghost
VERSION =		utopic
VERSION_ALIASES =	14.10
IS_LATEST =		1
TITLE =			Ghost 0.5.3
DESCRIPTION =		Ghost blogging platform
SOURCE_URL =		https://github.com/online-labs/image-app-ghost


## Image tools  (https://github.com/online-labs/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget https://raw.githubusercontent.com/online-labs/image-tools/master/docker-rules.mk
-include docker-rules.mk


## Here you can add custom commands and overrides
