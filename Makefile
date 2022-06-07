hooks := $(filter-out %~,$(wildcard hooks/*))
git_dir := $(shell git rev-parse --git-dir)

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
hooks: $(addprefix $(git_dir)/,$(hooks))
# Always merge to ensure post-merge hook runs
	git config pull.rebase false

$(git_dir)/hooks/%: hooks/%
	ln -s $(PWD)/$(<) $(@)

.PHONY: help
help: ## Show this help text
	$(info usage: make [target])
	$(info )
	$(info Available targets:)
	@awk -F ':.*?## *' '/^[^\t].+?:.*?##/ \
         {printf "  %-24s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
