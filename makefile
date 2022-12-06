PYTHON_VERSION=3

VENV=.venv

python=$(VENV)/bin/python
pip=$(VENV)/bin/pip3
jupyter=$(VENV)/bin/jupyter

# Utility scripts to prettify echo outputs
TERM ?= 'ansi'
bold := $(shell tput -T $(TERM) bold)
sgr0 := $(shell tput -T $(TERM) sgr0)


.PHONY: bootstrap
bootstrap: venv requirements


.PHONY: clean
clean:
	@echo "$(bold)Clean up old virtualenv and cache$(sgr0)"
	rm -rf $(VENV)

.PHONY: requirements
requirements:
	$(pip) install --upgrade RISE
	$(pip) install --upgrade jupyterlab numpy pandas matplotlib seaborn bokeh scipy scikit-learn 

.PHONY: venv
venv: clean
	@echo "$(bold)Create virtualenv$(sgr0)"
	virtualenv -p /usr/bin/python$(PYTHON_VERSION) $(VENV)
	$(pip) install --upgrade pip

.PHONY: run
run:
	$(jupyter) notebook
