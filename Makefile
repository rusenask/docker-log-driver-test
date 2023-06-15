# Plugin parameters
PLUGIN_NAME=monmohan/tldriver
PLUGIN_TAG=v1

build:
	docker build -t logs-plugin .

run: build
	docker run --rm --name logs-plugin -v /run/docker/plugins/:/run/docker/plugins/ -v /var/log/docker:/var/log/docker logs-plugin

# curl -H "Content-Type: application/json" -XPOST -d '{}' --unix-socket /run/docker/plugins/logs-plugin.sock http:/localhost/LogDriver.Capabilities