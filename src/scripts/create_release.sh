#!/bin/bash

set -x
set -eo pipefail

function create_release() {
    echo "Creating release ${INSTANA_RELEASE_NAME}"

    if [ -z "${INSTANA_RELEASE_SCOPE}" ]; then
        INSTANA_RELEASE_SCOPE='{}'
    fi

    echo "${INSTANA_RELEASE_SCOPE}" > scope.json

    if ! OUTPUT=$(jq empty scope.json 2>&1); then
        echo "Scope JSON is valid: ${OUTPUT}"
        exit 1
    fi

    curl --location --request POST "${!INSTANA_ENDPOINT_URL_NAME}/api/releases" \
        --silent \
        --fail \
        --show-error \
        --header "Authorization: apiToken ${!INSTANA_API_TOKEN_NAME}" \
        --header "Content-Type: application/json" \
        --data "{
    \"name\": \"${INSTANA_RELEASE_NAME}\",
    \"start\": $(date +%s)000,
    \"applications\": $(jq -r '.applications' < scope.json),
    \"services\": $(jq -r '.services' < scope.json)
}" | jq -r ".id" | xargs -I {} echo "New release created with id {}"
}

create_release