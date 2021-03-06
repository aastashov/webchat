FROM python:2.7

RUN apt-get update \
    && apt-get install -y python-pip python-dev

COPY . /srv/webchat

RUN pip install -r /srv/webchat/requirements.txt

COPY ./volumes/uwsgi.ini /etc/uwsgi/sites/webchat.ini

ENTRYPOINT ["/srv/webchat/volumes/entrypoint.sh"]

CMD ["uwsgi", "--ini", "/etc/uwsgi/sites/webchat.ini", "--chmod-socket", "--stats", "/tmp/webchat-statsock"]
