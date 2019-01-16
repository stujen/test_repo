venv: setup.py
	python3 -m venv venv
	./venv/bin/pip install --upgrade pip
	./venv/bin/pip install -e .[tests,docs,deploy]
	touch venv

test: venv
	./venv/bin/pytest --cov -rfsxEX --cov-report term-missing

flake8: venv
	./venv/bin/flake8 U_FaIR tests setup.py _version.py

.PHONY: black
black: venv
	@status=$$(git status --porcelain pymagicc tests); \
	if test "x$${status}" = x; then \
		./venv/bin/black --exclude _version.py --py36 setup.py U_FaIR tests; \
	else \
		echo Not trying any formatting. Working directory is dirty ... >&2; \
	fi;

# first time setup, follow this https://blog.jetbrains.com/pycharm/2017/05/how-to-publish-your-package-on-pypi/
# then this works
.PHONY: publish-on-testpypi
publish-on-testpypi:
	-rm -rf build dist
	@status=$$(git status --porcelain); \
	if test "x$${status}" = x; then \
		./venv/bin/python setup.py sdist bdist_wheel --universal; \
		./venv/bin/twine upload -r testpypi dist/*; \
	else \
		echo Working directory is dirty >&2; \
	fi;

test-testpypi-install: venv
	$(eval TEMPVENV := $(shell mktemp -d))
	python3 -m venv $(TEMPVENV)
	$(TEMPVENV)/bin/pip install pip --upgrade
	# Install dependencies not on testpypi registry
	# e.g. $(TEMPVENV)/bin/pip install pandas
	# Install ufair without dependencies.
	$(TEMPVENV)/bin/pip install \
		-i https://testpypi.python.org/pypi ufair \
		--no-dependencies --pre
	@echo "This doesn't test dependencies"
	$(TEMPVENV)/bin/python -c "from ufair import *; import ufair; print(ufair.__version__)"

.PHONY: publish-on-pypi
publish-on-pypi:
	-rm -rf build dist
	@status=$$(git status --porcelain); \
	if test "x$${status}" = x; then \
		./venv/bin/python setup.py sdist bdist_wheel --universal; \
		./venv/bin/twine upload dist/*; \
	else \
		echo Working directory is dirty >&2; \
	fi;

test-pypi-install: venv
	$(eval TEMPVENV := $(shell mktemp -d))
	python3 -m venv $(TEMPVENV)
	$(TEMPVENV)/bin/pip install pip --upgrade
	$(TEMPVENV)/bin/pip install ufair --pre
	$(TEMPVENV)/bin/python scripts/test_install.py

.PHONY: test-install
test-install: venv
	$(eval TEMPVENV := $(shell mktemp -d))
	python3 -m venv $(TEMPVENV)
	$(TEMPVENV)/bin/pip install pip --upgrade
	$(TEMPVENV)/bin/pip install .
	$(TEMPVENV)/bin/python scripts/test_install.py

clean:
	rm -rf venv

.PHONY: clean test black flake8 docs publish-on-pypi test-pypi-install
