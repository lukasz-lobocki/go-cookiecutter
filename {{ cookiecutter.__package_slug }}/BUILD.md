# {{ cookiecutter.package_name }}

## Build

To build the solution with dirty repository, use the following command with `--snapshot` parameter.

```bash
goreleaser build --clean --snapshot
```

## Typical release workflow

```bash
git add --update
```

```bash
git commit -m "fix: Change."
```

```bash
git tag "$(svu next --force-patch-increment)"
git push --tags
goreleaser release --clean
```

## Cookiecutter initiation

```bash
cookiecutter \
  ssh://git@github.com/lukasz-lobocki/go-cookiecutter.git \
  package_name="{{ cookiecutter.package_name }}"
```

### was run with following variables

- package_name: **`{{ cookiecutter.package_name }}`**;
package_short_description: `{{ cookiecutter.package_short_description }}`

- package_version: `{{ cookiecutter.package_version }}`

- author_name: `{{ cookiecutter.author_name }}`;
open_source_license: `{{ cookiecutter.open_source_license }}`

- __package_slug: `{{ cookiecutter.__package_slug }}`

### on

`{% now 'local', '%Y-%m-%d %H:%M:%S %z' %}`
