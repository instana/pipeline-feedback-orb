# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.1] - 2022-12-20

- Include the ability to parse environments in `release_scope` parameter
## [2.0.0] - 2022-03-31

- Use icr.io as registry for the default executor

## [1.3.1] - 2021-03-25

- Add user-agent header

## [1.0.2] - 2020-12-15

- Introduce a new default executor, `instana/pipeline-feedback-orb-executor`, to remove dependencies on specific package managers from the `create_release.sh` script.

## [1.0.1] - 2020-11-24

- Interpolate environment variables in release names.
- Make executor configurable for the job.
- Spiced up the example to provide a more realistic workflow structure.

## [1.0.0] - 2020-11-15

### Added

- Initial Release

[1.0.1]: https://github.com/instana/pipeline-feedback-orb/tag/v1.0.1
[1.0.0]: https://github.com/instana/pipeline-feedback-orb/tag/v1.0.0
