setup() {
    source ./src/scripts/create_release.sh
}

export INSTANA_RELEASE_NAME="Test CircleCI release"

output_regexp='^New release created with id .*$'

if [ -z "${INSTANA_ENDPOINT_URL_NAME}" ]; then
    INSTANA_ENDPOINT_URL_NAME='INSTANA_ENDPOINT_URL'
fi

if [ -z "${INSTANA_API_TOKEN_NAME}" ]; then
    INSTANA_API_TOKEN_NAME='INSTANA_API_TOKEN'
fi

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
