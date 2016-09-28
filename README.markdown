# riemann-tools docker image

Run any of the [riemann-tools](https://github.com/riemann/riemann-tools) as a docker container.

## Configuring the event host name

This docker image will try the following sources to use as the `--event-host` option (in this order):

1. Content of the file /docker-hostname
2. Environment variable `EVENT_HOST`
3. Output of running ``hostname`` in the container


## Pure docker

Running in pure docker and, as an example, setting a custom `--event-host` for `riemann-health` via environment variable:

```shell
❯ docker run --privileged --pid host -e EVENT_HOST=my_hostname creators/riemann-tools health --cpu-warning 0.8
running: riemann-health --event-host my_hostname --cpu-warning 0.8
[...]
$
```

## Docker Compose

Here, we're running in docker-compose and, as an example, setting the `--event-host` by mounting the docker host's `/etc/hostname` into our container:

```yaml
riemann-tools-proc:
  image: 'creators/riemann-tools:latest'
  command: 'health --cpu-warning 0.8'
  links:
    - 'riemann-riemann:riemann'
  pid: host
  privileged: true
  volumes:
    - '/etc/hostname:/docker-hostname:ro'
```


## Docker Cloud stackfile

In docker cloud, you probably want to run `riemann-health` on all your nodes:

```yaml
riemann-tools-proc:
  image: 'creators/riemann-tools:latest'
  command: 'health --cpu-warning 0.8'
  deployment_strategy: every_node
  links:
    - 'riemann-riemann:riemann'
  pid: host
  privileged: true
  restart: always
```
