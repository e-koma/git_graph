FROM node:10.12-alpine

USER root
WORKDIR /root

RUN apk update \
    && apk add --no-cache \
       nginx

RUN apk add --no-cache --virtual .build-deps \
      git \
    && npm install --save gitgraph.js \
    && git clone --depth 1  http://github.com/nicoespeon/gitgraph.js.git \
    && mkdir lib \
    && cp gitgraph.js/src/gitgraph.* lib/ \
    && rm -Rf gitgraph.js \
    && apk del .build-deps

COPY . ./
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["./docker-run.sh"]
