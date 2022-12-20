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
            "name": "test-acceptor"
        }]
    }'

    run ./src/scripts/create_release.sh
    [ "$status" -eq 0 ]
}

@test '3: Create Service-scoped Release' {
    export INSTANA_RELEASE_SCOPE='
    {
        "services": [{
            "name": "acceptor"
        }]
    }'

    run ./src/scripts/create_release.sh
    [ "$status" -eq 0 ]
}

@test '4: Malformed scope JSON' {
    export INSTANA_RELEASE_SCOPE='{'

    run ./src/scripts/create_release.sh
    [ "$status" -eq 1 ]
}

@test '5: Create Service-scoped Release using environments' {
    export LOCAL_TEST5_SERVICE_NAME=acceptor
    export INSTANA_RELEASE_SCOPE='
    {
        "services": [{
            "name": "${LOCAL_TEST5_SERVICE_NAME}"
        }]
    }'

    run ./src/scripts/create_release.sh
    [ "$status" -eq 0 ]
}
