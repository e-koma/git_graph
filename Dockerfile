FROM node:10.12-alpine

RUN apk add --no-cache --virtual .build-deps \
      git \
    && npm install --save gitgraph.js \
    && git clone --depth 1  http://github.com/nicoespeon/gitgraph.js.git \
    && mkdir lib \
    && cp gitgraph.js/src/gitgraph.* lib/ \
    && rm -Rf gitgraph.js \
    && apk del .build-deps
