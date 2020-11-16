if [ -z "${INSTANA_ENDPOINT_URL_NAME}" ]; then
    export INSTANA_ENDPOINT_URL_NAME='INSTANA_ENDPOINT_URL'
    export INSTANA_ENDPOINT_URL
fi

if [ -z "${INSTANA_API_TOKEN_NAME}" ]; then
    export INSTANA_API_TOKEN_NAME='INSTANA_API_TOKEN'
    export INSTANA_API_TOKEN
fi

export INSTANA_RELEASE_NAME="BATS 2 Test CircleCI release"

@test '1: Create Global Release' {
    run ./src/scripts/create_release.sh
    [ "$status" -eq 0 ]
}

@test '2: Create Application-scoped Release' {
    export INSTANA_RELEASE_SCOPE='
    {
        "applications": [{
            "name": "cordelia"
        }]
    }'

    run ./src/scripts/create_release.sh
    [ "$status" -eq 0 ]
}

@test '2: Malformed scope JSON' {
    export INSTANA_RELEASE_SCOPE='{'

    run ./src/scripts/create_release.sh

    [ "$status" -eq 1 ]
}
