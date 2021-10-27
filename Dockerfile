FROM driveone/onedrive:alpine

RUN apk update && apk --no-cache add python3-dev py3-pip gcc musl-dev linux-headers zeromq-dev libffi-dev nginx
RUN pip install jupyterlab supervisor json2html

ENTRYPOINT [""]

COPY config /etc/onedrive/
COPY supervisord.conf /etc/
RUN mkdir /work
COPY *.ipynb /work/
WORKDIR /work

EXPOSE 8888 9001
CMD /usr/bin/supervisord -c /etc/supervisord.conf
