FROM envoyproxy/envoy-alpine:v1.20-latest AS envoy
FROM driveone/onedrive:alpine

RUN apk update && apk --no-cache add python3-dev py3-pip gcc musl-dev linux-headers zeromq-dev libffi-dev nginx curl
RUN pip install jupyterlab supervisor json2html
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

ENTRYPOINT [""]

COPY config /etc/onedrive/
COPY supervisord.conf /etc/
RUN mkdir /work
COPY *.ipynb /work/
WORKDIR /work
RUN mkdir /etc/envoy
COPY envoy.yml /etc/envoy/

COPY --from=envoy /usr/local/bin/envoy /usr/local/bin/
RUN apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
    apk add glibc-2.28-r0.apk

EXPOSE 8888 9001
CMD /usr/bin/supervisord -c /etc/supervisord.conf
