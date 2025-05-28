FROM python:3.13-alpine

ENV GITCHANGELOG_CONFIG_FILENAME="/usr/local/etc/gitchangelog.rc"

COPY requirements.txt /var/tmp/requirements.txt

# hadolint ignore=DL3018
RUN apk add --no-cache git \
  && git config --global --add safe.directory /mnt/source \
  && pip install --no-cache-dir -r /var/tmp/requirements.txt

COPY gitchangelog-rc.py /usr/local/etc/gitchangelog.rc

WORKDIR /mnt/source

ENTRYPOINT ["/bin/sh", "-c", "gitchangelog"]
