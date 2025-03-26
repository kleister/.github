# Kleister: GitHub

[![General Workflow](https://github.com/kleister/.github/actions/workflows/general.yml/badge.svg)](https://github.com/kleister/.github/actions/workflows/general.yml) [![Join the Matrix chat at https://matrix.to/#/#kleister:matrix.org](https://img.shields.io/badge/matrix-%23kleister%3Amatrix.org-7bc9a4.svg)](https://matrix.to/#/#kleister:matrix.org)

This repository contains some scripts to configure the Github organization like
adding teams and members besides the profile displayed on the organization page.

## Usage

We are using [Terraform][terraform] to provision all related parts. Every change
have to be submitted via pull requests, after merging the pull request the
changes are getting applied automatically by our CI system. It is possible to
execute everything from a workstation, but it's encouraged to keep it in the
hands of our CI system.

### Variables

To get access to the secrets you got to install the 1Password CLI and export the
environment variable `OP_SERVICE_ACCOUNT_TOKEN` which you can find in our shared
store, after that you can simply execute the commands below.

```console
cat << EOF >| .envrc
use flake . --impure

export GITHUB_TOKEN=$(op read op://Kleister/Github/token)

export AWS_ACCESS_KEY_ID=$(op read op://Kleister/Terraform/username)
export AWS_SECRET_ACCESS_KEY=$(op read op://Kleister/Terraform/password)
EOF

direnv allow
```

### Deployment

```console
bin/terraform init
bin/terraform plan
bin/terraform apply
```

## Security

If you find a security issue please contact
[kleister@webhippie.de](mailto:kleister@webhippie.de) first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

*   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2018 Thomas Boerger <thomas@webhippie.de>
```

[terraform]: https://www.terraform.io/
