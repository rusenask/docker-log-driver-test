

1. Start plugin `make run` (it builds & executes `docker run --rm --network host --name logs-plugin -v /run/docker/plugins/:/run/docker/plugins/ -v /run/docker/logging:/run/docker/logging logs-plugin`)
2. Start docker run --log-driver lp1 hello-world