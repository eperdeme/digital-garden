.DEFAULT_GOAL := docs

.PHONY: update
update:
	@echo "-------------------------"
	@echo "- Updating dependencies -"
	@echo "-------------------------"

	rm requirements.txt
	touch requirements.txt
	pip-compile -Ur requirements.in --allow-unsafe

	pip install -r requirements.txt

	@echo ""

.PHONY: clean
clean:
	@echo "---------------------------"
	@echo "- Cleaning unwanted files -"
	@echo "---------------------------"

	rm -rf site/
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.py[co]" -delete
	find . -type f -name "*~" -delete
	find . -type f -name ".*~" -delete
	rm -rf .cache .pytest_cache .mypy_cache
	rm -rf build/ dist/ *.egg-info

	@echo ""

.PHONY: lint
lint:
	@echo "---------------------------"
	@echo "- Linting repository      -"
	@echo "---------------------------"

	pre-commit run --all-files

	@echo ""

.PHONY: docs
docs:
	@echo "-------------------------"
	@echo "- Serving documentation -"
	@echo "-------------------------"

	mkdocs serve

	@echo ""

.PHONY: bump
bump: pull-main bump-version clean

.PHONY: pull-main
pull-main:
	@echo "------------------------"
	@echo "- Updating repository  -"
	@echo "------------------------"

	git checkout main
	git pull

	@echo ""

.PHONY: build-docs
build-docs:
	@echo "--------------------------"
	@echo "- Building documentation -"
	@echo "--------------------------"

	mkdocs build

	@echo ""

.PHONY: bump-version
bump-version:
	@echo "---------------------------"
	@echo "- Bumping program version -"
	@echo "---------------------------"

	cz bump --changelog --no-verify
	git push
	git push --tags

	@echo ""
