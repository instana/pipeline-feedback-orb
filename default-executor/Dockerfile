FROM ubuntu:focal

RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg2 ca-certificates jq curl gettext  && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*