TARGETS := $(shell ls scripts | grep -vE 'clean')

.dapper:
	@echo Downloading dapper
	@curl -sL https://github.com/rancher/dapper/releases/download/v0.5.4/dapper-`uname -s`-`uname -m` > .dapper.tmp
	@@chmod +x .dapper.tmp
	@./.dapper.tmp -v
	@mv .dapper.tmp .dapper

$(TARGETS): .dapper
	./.dapper $@ 2>&1 | tee $@.log

shell-bind: .dapper
	./.dapper -m bind -s

kernel-config: .dapper
	./.dapper config-kernel

clean:
	@./scripts/clean

.DEFAULT_GOAL := ci

.PHONY: $(TARGETS)
