
export FFEBH_BUILD_USER := $(shell keyring get ffebh build-user)
export FFEBH_BUILD_PASS_CRYPTED := $(shell keyring get ffebh build-password | openssl passwd -6 -stdin)
export FFEBH_BUILD_PASS := $(shell keyring get ffebh build-password)

.PHONY: box builder keyring test

all:
	@helper/build.py

clean:
	@rm -rf packer_cache

builder:
	@echo "Build user = ${FFEBH_BUILD_USER}"
	@echo "Build pass = ${FFEBH_BUILD_PASS}"

keyring:
	@echo "USERNAME for build-user"
	@$@ set ffebh build-user
	@echo "PASSWORD for build-user"
	@$@ set ffebh build-password
	@echo "USERNAME for system-user"
	@$@ set ffebh system-user
	@echo "PASSWORD for system-user"
	@$@ set ffebh system-password
	@echo "PASSWORD for samba-admin"
	@$@ set ffebh samba-admin

test: clean
	@packer build $@.json
