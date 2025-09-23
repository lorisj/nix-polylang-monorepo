# Python gRPC bindings

## When editing/generating proto files:
- For every proto package (for instance `example/v1`, make sure there is a `__init__.py` file in the folder)

- For each base package (e.g. `example`), you can add a target so that the package is included:
```toml
[tool.hatch.build.targets.wheel]
packages = ["example"]
```