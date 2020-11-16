setup() {
    source ./src/scripts/create_release.sh
}

if [ -z "${INSTANA_ENDPOINT_URL}" ] && [ -n "${INSTANA_IT_ENDPOINT_URL}" ]; then
    INSTANA_ENDPOINT_URL='INSTANA_IT_ENDPOINT_URL'
fi

if [ -z "${INSTANA_API_TOKEN}" ] && [ -n "${INSTANA_IT_ENDPOINT_URL}" ]; then
    INSTANA_API_TOKEN='INSTANA_IT_API_TOKEN'
fi

export INSTANA_RELEASE_NAME="Test CircleCI release"

output_regexp='^New release created with id .*$'

@test '1: Create Global Release' {
    [[ $(create_release) =~ ${output_regexp} ]]
}

@test '2: Create Application-scoped Release' {
    export INSTANA_RELEASE_SCOPE='{
        "applications": [{
            "name": "All Discovered Services"
        }]
    }'

    [[ $(create_release) =~ ${output_regexp} ]]
}
