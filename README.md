# Instana Pipeline Feedback CircleCI Orb

[![CircleCI Build Status](https://circleci.com/gh/instana/pipeline-feedback-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/instana/pipeline-feedback-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/instana/pipeline-feedback)](https://circleci.com/orbs/registry/orb/instana/pipeline-feedback)

Instana [Pipeline Feedback](https://www.instana.com/docs/pipeline_feedback/) is an automatic analysis of application development and deployment pipeline events, correlated directly with application, infrastructure, and service performance data.

## Usage

The following example assumes that you set the `INSTANA_ENDPOINT_URL` and `INSTANA_API_TOKEN` [environment variables in your CircleCI project](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project):

```yaml
version: 2.1

orbs:
  pipeline-feedback: instana/pipeline-feedback@1.1

workflows:
  create_release:
    jobs:
      - pipeline-feedback/create_release:
          release_name: My awesome test release
```

In case you want to customize which environment variables to use to look up the Instana endpoint URL and the respective API token, you can use the `endpoint` and `api_token` parameters as follows:

```yaml
version: 2.1

orbs:
  pipeline-feedback: instana/pipeline-feedback@1.1

workflows:
  create_release:
    jobs:
      - pipeline-feedback/create_release:
          endpoint: MY_INSTANA_ENDPOINT_URL
          api_token: MY_INSTANA_API_TOKEN
          release_name: My awesome test release
```

In the example above, the endpoint URL and the matching API token will be looked up using the `MY_INSTANA_ENDPOINT_URL` and `MY_INSTANA_API_TOKEN` environment variables, respectively.

## Contributing

Ah, our kind of person!
Go ahead, open a PR.

Please be aware that we will be able to accept only code contributed under the Apache 2.0 license.
