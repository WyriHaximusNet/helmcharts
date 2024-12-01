# set all to phony
SHELL=bash

.PHONY: *

generate:
	docker run -v $$(pwd):/helm-docs jnorwood/helm-docs:v1.9.1 --document-dependency-values=true

