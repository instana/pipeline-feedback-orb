# Developing the Pipeline Feedback Orb

## Some notes about the Orb

* Always develop scripts trying to:
  * Keep the dependencies (`jq`, for example) stable so that...
  * ... people can use their on [executors](https://circleci.com/docs/2.0/executor-intro) rather than our [default executor](https://github.com/instana/pipeline-feedback-orb/tree/main/default-executor)
* When adding configurations properties, remember to update both the [jobs](https://github.com/instana/pipeline-feedback-orb/tree/main/src/jobs) and the [command](https://github.com/instana/pipeline-feedback-orb/tree/main/src/commands)
* Add [Bats](https://github.com/sstephenson/bats) tests for new functionality to the [tests](https://github.com/instana/pipeline-feedback-orb/tree/main/src/tests)

## Release process

The release process is pretty much the one [defined by the Orb Development Kit](https://circleci.com/docs/2.0/creating-orbs/), and it is triggered by `[semver:...]` tags in commit messages.
The build pipeline is in the [`instana` CircleCI organization](https://app.circleci.com/pipelines/github/instana/pipeline-feedback-orb), and there is one manual step for letting the release go through (opt-in by the developer to avoid spurious releases).

The release process from CircleCI needs the [configuration of GitHub SSH keys](https://app.circleci.com/settings/project/github/instana/pipeline-feedback-orb/ssh?return-to=https%3A%2F%2Fapp.circleci.com%2Fpipelines%2Fgithub%2Finstana%2Fpipeline-feedback-orb), refer to [this documentation](https://circleci.com/docs/2.0/add-ssh-key/) for more info.
