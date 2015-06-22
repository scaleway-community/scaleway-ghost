DOCKER_NAMESPACE =	armbuild/
NAME =			scw-app-ghost
VERSION =		latest
VERSION_ALIASES =	0.6.4
TITLE =			Ghost
DESCRIPTION =		Ghost blogging platform
SOURCE_URL =		https://github.com/scaleway/image-app-ghost


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
## Below you can add custom makefile commands and overrides
