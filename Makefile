define skaffold_build
    cd $(1); skaffold build
endef

.PHONY: all base ansible

base:
	$(call skaffold_build,'./base')

ansible:
	$(call skaffold_build,'./ansible')

all: base ansible
