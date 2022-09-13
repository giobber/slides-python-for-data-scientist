PYTHON_VERSION=3

VENV=.venv
PYTHON=$(VENV)/bin/python
PIP=$(VENV)/bin/pip3

# Utility scripts to prettify echo outputs
TERM ?= 'ansi'
bold := $(shell tput -T $(TERM) bold)
sgr0 := $(shell tput -T $(TERM) sgr0)


.PHONY: bootstrap
bootstrap: venv
	$(PIP) install --upgrade RISE


.PHONY: clean
clean:
	@echo "$(bold)Clean up old virtualenv and cache$(sgr0)"
	rm -rf $(VENV)

.PHONY: venv
venv: clean
	@echo "$(bold)Create virtualenv$(sgr0)"
	virtualenv -p /usr/bin/python$(PYTHON_VERSION) $(VENV)
	$(PIP) install --upgrade pip

.PHONY: run
run:
	$(VENV)/bin/jupyter notebook
