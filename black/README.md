# Black action

## Usage

```
action "black" {
  uses = "stratasan/actions/black@master"
}
```

This runs `black --check .` in the working directory of GitHub Actions (where your repository is mounted).

If your project has a `pyproject.toml` in the top-level, that file is passed into `--config` so it'll
run `black --config pyproject.toml --check .`

This action will be most useful in a workflow that's bound to the `push` event. Ideally this action is run on all
pushes to verify black formatting in your repository.
