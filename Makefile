.PHONY: deps run clean

define copytolib
	cp bower_components/TimelineJS/build/$1 www/lib/
endef

bower_components: bower.json node_modules
	node_modules/bower/bin/bower install
	mkdir www/lib
	$(call copytolib,"js/timeline.js")
	$(call copytolib,"js/storyjs-embed.js")
	$(call copytolib,"css/timeline.css")
	$(call copytolib,"css/loading.gif")
	$(call copytolib,"css/timeline.png")

node_modules: package.json
	npm install

deps: | node_modules/ bower_components/

run:
	cd www && python -m SimpleHTTPServer 8000

clean: 
	rm -Rf node_modules/ bower_components/ www/lib
