HOOKS := $(filter-out %~,$(wildcard hooks/*))
GIT_DIR := $(shell git rev-parse --git-dir)

.PHONY: all
all: ## Perform all default setup actions
all: index hooks

.PHONY: index
index: ## Build port index
index: PortIndex

PortIndex:
	portindex

.PHONY: hooks
hooks: ## Install helpful git hooks
hooks: $(foreach _,$(HOOKS),$(GIT_DIR)/hooks/$(notdir $(_)))
# Always merge to ensure post-merge hook runs
	git config pull.rebase false

$(GIT_DIR)/hooks/%: hooks/%
	ln -s $(PWD)/$(<) $(@)

.PHONY: help
help: ## Show this help text
	$(info usage: make [target])
	$(info )
	$(info Available targets:)
	@awk -F ':.*?## *' '/^[^\t].+?:.*?##/ \
         {printf "  %-24s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
