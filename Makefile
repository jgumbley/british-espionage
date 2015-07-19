.PHONY: deps run clean

node_modules: package.json
	npm install

bower_components: bower.json node_modules
	node_modules/bower/bin/bower install

deps: | node_modules/ bower_components/

run:
	cd www && python -m SimpleHTTPServer 8000

clean: 
	rm -Rf node_modules/ bower_components/
