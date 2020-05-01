
export FFEBH_BUILD_USER := $(shell keyring get ffebh build-user)
export FFEBH_BUILD_PASS_CRYPTED := $(shell keyring get ffebh build-password | openssl passwd -6 -stdin)
export FFEBH_BUILD_PASS := $(shell keyring get ffebh build-password)

.PHONY: add box builder destroy keyring provision ssh test up

add:
	@vagrant box add ./builds/virtualbox/ffebh-test.box --name ffebh-test --force

builder:
	@echo "Build user = ${FFEBH_BUILD_USER}"
	@echo "Build pass = ${FFEBH_BUILD_PASS}"

clean:
	@rm -rf packer_cache

destroy:
	@vagrant destroy

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

provision: up
	@vagrant provision

ssh:
	@vagrant ssh

test: clean
	@packer build $@.json

up: add
	@vagrant up
