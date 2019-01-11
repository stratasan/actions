# Run shell commands alongside NPM

This allows you to run various shell commands within a Node container

```
action "npm commands" {
    uses = "stratasan/actions/npm@master"
    args = [
        "npm run lint",
        "npm run test"
    ]
}
```

This can be achieved with multiple generic `npm` actions but would require parallel actions.
As this is written, it lets you run multiple commands in a single action.
