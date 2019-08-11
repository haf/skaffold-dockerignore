# Minimal bug repro skaffold ↔ docker differences

Repro, docker, works:

    docker build .

Skaffold, does not work:

    skaffold run

The Skaffold command fails because `.dockerignore` is incorrectly read and `pages/` is not sent to the docker daemon,
but `docker` works.

Expected both to behave the exact same way.

- [.dockerignore reference](https://docs.docker.com/engine/reference/builder/#dockerignore-file)
