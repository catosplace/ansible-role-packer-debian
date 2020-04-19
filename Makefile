default: lint

lint: lint-yaml ansible-lint

lint-yaml:
	@docker run --rm $$(tty -s && echo "-it" || echo) \
		 -v $(PWD):/data cytopia/yamllint:latest .

ansible-lint:
	@docker run --rm $$(tty -s && echo "-it" || echo) \
		-v $(PWD):/data/$(PWD) \
		-e ANSIBLE_ROLE_PATH="/data" \
		cytopia/ansible-lint \
		/data/$(PWD)/tests/test.yml

PHONY: lint lint-yaml ansible-lint
