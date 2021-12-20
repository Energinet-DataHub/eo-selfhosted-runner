# eo-selfhosted-runner

Docker image for SelfHosted GitHub runner.

This image is designed to run ephemeral, so the container will shutdown and terminate after each job, as to ensure no leaking of data between workflows.

The image will be used in conjunction with Azure Container Instance to execute deployments in a private network.

## Configuration

The container is configured through environment variables.

| Env variable  | Req/opt       |  example      | Description   |
|----------     |----------     |----------     |----------     |
| REPOSITORY    | REQUIRED      | https://github.com/{org}/{repo} | The repository the runner should register at. |
| TOKEN         | REQUIRED      | RF124DFG...   | The token used to register, can be generated on the GitHub API or UI. |
| NAME          | REQUIRED      | test-runner   | The name for the runner, it will override existing runners with the same name. |
| LABELS        | OPTIONAL      | foo,bar,baz   | A comma separated list of labels for the runner. |
