

1. Place `lp.spec` into `/etc/docker/plugins` directory
2. Start plugin `make run` (it builds & executes `docker run --rm --network host --name logs-plugin -v /run/docker/plugins/:/run/docker/plugins/ -v /run/docker/logging:/run/docker/logging logs-plugin`)
3. Start docker run --log-driver lp hello-world