FROM docker:stable

ENV AWSCLI_VERSION "1.18.10"

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install awscli==$AWSCLI_VERSION --upgrade --user \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/root/.local/bin/aws"]
