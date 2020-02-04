FROM cloudron/base:1.0.0@sha256:147a648a068a2e746644746bbfb42eb7a50d682437cead3c67c933c546357617

RUN mkdir -p /app/code
WORKDIR /app/code

# install nodejs
RUN mkdir -p /usr/local/node-10.15.3 && \
    curl -L https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.gz | tar zxf - --strip-components 1 -C /usr/local/node-10.15.3

ENV PATH /usr/local/node-10.15.3/bin:$PATH

# copy code
ADD package.json server.js start.sh /app/code/

# install packages
RUN npm install

CMD [ "/app/code/start.sh" ]
