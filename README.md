# Instana Pipeline Feedback CircleCI Orb

Instana [Pipeline Feedback](https://www.instana.com/docs/pipeline_feedback/) is an automatic analysis of application development and deployment pipeline events, correlated directly with application, infrastructure, and service performance data.

## Examples

```yaml
version: 2.1
orbs:
pipeline-feedback: instana/pipeline-feedback@1.0.0
workflows:
create_release:
    jobs:
    - pipeline-feedback/create_release
jobs:
create_release:
    steps:
    - pipeline-feedback/create_release:
        endpoint: https://apm-awesome.instana.io
        api_token: < api token, store it in secrets if you can >
        release_name: My awesome release
        release_scope: >
            {
                "applications": [
                    { "name": "My Awesome App" },
                    { "name": "My Even More Awesome App" },
                ],
                "services": [
                    { "name": "Cool service #1" },
                    {
                    "name": "Cool service #2",
                    "scopedTo": {
                        "applications": [
                        { "name": "My Cool App" }
                        ]
                    }
                    }
                ]
            }
```

## Contributing

Ah, our kind of person!
Go ahead, open a PR.

Please be aware that we will be able to accept only code contributed under the Apache 2.0 license.
