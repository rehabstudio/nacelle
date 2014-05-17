help:
	@echo "clean - clean up/remove build artefacts"
	@echo "test - run all of the app's tests and print a coverage report"

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

test: clean
	coverage erase
	coverage run --source="nacelle" --omit="google_appengine/*,nacelle/vendor/*" nacelle/test/runner.py
	coverage report -m
