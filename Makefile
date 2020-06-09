HOOKS := $(filter-out %~,$(wildcard hooks/*))
GIT_DIR := $(shell git rev-parse --git-dir)

.PHONY: hooks
hooks:  ## Install helpful git hooks
hooks: $(foreach _,$(HOOKS),$(GIT_DIR)/hooks/$(notdir $(_)))

$(GIT_DIR)/hooks/%: hooks/%
	ln -s $(PWD)/$(<) $(@)

.PHONY: help
help: ## Show this help text
	$(info usage: make [target])
	$(info )
	$(info Available targets:)
	@awk -F ':.*?## *' '/^[^\t].+?:.*?##/ \
         {printf "  %-24s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
