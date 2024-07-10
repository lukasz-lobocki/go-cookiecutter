# {{ cookiecutter.package_name }}

## Build

```bash
goreleaser build --clean
```

## Typical release workflow

```bash
git add --update
```

```bash
git commit -m "fix: change"
```

```bash
git tag "$(svu next)"
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

- package_slug: `{{ cookiecutter.package_slug }}`

### on

`{% now 'local', '%Y-%m-%d %H:%M:%S %z' %}`
