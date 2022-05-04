# GitHub Repo Runner

GitHub allows developers to run GitHub Actions workflows on one own runners.
This Docker image is intended to be used as locally hosted runner for the
[ibis-hdl](https://github.com/ibis-hdl) project. This is based on
myoung34's [Docker Github Actions Runner](https://github.com/myoung34/docker-github-actions-runner).

## Usage

You can create a `.env` to provide environment variables when using docker-compose, e.g.:

```
GH_RUNNER_NAME="localhost"
GH_RUNNER_LABELS="compiler"
GH_RUNNER_WORKDIR=/home/ibis-hdl/work
```

It's not mandatory and the `docker-compose.yml` holds predefined values, intentionally project related.

In order to link your runner to repository, an `ACCESS_TOKEN` containing a [Personal Access Token](https://github.com/settings/tokens) (PAT) is required. This token will be used to dynamically fetch a new runner token, as runner tokens are valid for a short period of time (1 hour).

To prevent accidental publication, the PAT is in a separate `github_pat.txt` file stored:

```
ACCESS_TOKEN=<PAT goes here>
```

and entered in `.gitignore` and `.dockerignore`.
