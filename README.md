# actions

Shared GitHub Actions we use across our codebases

## Designing a Generic Python Action

We're hoping to replace most if not of all our CICD pipelines currently implemented in Jenkins with GitHub Actions. To us, a simple CI environment should provide a necessary runtime (python/node/etc) and then execute shell scripts. We currently use a lot of Jenkinsfiles that look like:

```
...
docker.image('IMAGE').inside("-u 0") {
  sh 'apk add -U --no-cache bash git make'
  sh '''#!/bin/bash -ex
    make install build test
  '''
}
...
```

So we were excited to read about the design of GitHub Actions because we're already running everything within containers in Jenkins. However, Jenkins is clearly doing some interesting things to circumvent the image's ENTRYPOINT. For example, any [python image on Docker Hub](https://hub.docker.com/_/python/) will drop into the python interpreter upon starting the container because that's what the ENTRYPOINT defines. But above in the Jenksinsfile snippet, we're just running shell scripts. So something has to give.

We believe that the following action is both easy to read and very generic.

```hcl
action "python action" {
  uses = "stratasan/actions/python-3.6@master"
  args = [
    "pip install -r requirements.txt",
    "flake8 .",
    "py.test"
  ]
```

The `args` is simply a list of shell commands to run and the action will fail if any return non-zero.

## Other actions

We also plan to provide other more specific actions.

### Installation dependencies into a virtual environment

Using this action:

```
action "venv install" {
  uses = "stratasan/actions/venv-3.6@master"
  args = ["requirements.txt", "requirements-dev.txt"]
}
```

will

* Using a python3.6 interpreter, produce a virtualenv at `/github/workspace/venv` (`/github/workspace` is the WORKDIR of all actions).
* Activate that virtual environment
* Install all requirements files give in `args`

Because this virtual environment is written to the shared filesystem and not `/usr/local/lib/python3.6/site-packages`, it can be reused across multiple actions in a workflow.

### Checking formatting with Black

The [black code formatter](https://github.com/ambv/black) can be used with a `--check` argument to ensure files would not be changed and return non-zero if changes would be written. In CI, this is a great way to prevent code styles not adhering to black from being merged.

```
action "lint" {
  uses = "stratasan/actions/black@master"
}
```

This will run `black --check .`
