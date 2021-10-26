FROM driveone/onedrive:alpine

RUN apk update && apk --no-cache add python3-dev py3-pip gcc musl-dev linux-headers zeromq-dev libffi-dev nginx
RUN pip install jupyterlab supervisor # oauthlib requests

ENTRYPOINT [""]

COPY supervisord.conf /etc/
RUN mkdir /work
COPY OneDriveLogin.ipynb /work/
WORKDIR /work

EXPOSE 8888 9001
CMD /usr/bin/supervisord -c /etc/supervisord.conf
