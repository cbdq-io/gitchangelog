FROM python:3.13

ENV GITCHANGELOG_CONFIG_FILENAME="/usr/local/etc/gitchangelog.rc"
COPY requirements.txt /var/tmp/requirements.txt
RUN pip install --no-cache-dir -r /var/tmp/requirements.txt
COPY gitchangelog-rc.py /usr/local/etc/gitchangelog.rc

WORKDIR /mnt/source
ENTRYPOINT ["/bin/sh", "-c", "gitchangelog"]
