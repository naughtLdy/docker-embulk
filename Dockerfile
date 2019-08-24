FROM alpine:3.9

ENV EMBULK_VERSION=0.9.18

RUN apk add --no-cache openjdk8 curl libc6-compat && \
  curl --create-dirs -o /embulk/bin/embulk -L "https://bintray.com/artifact/download/embulk/maven/embulk-${EMBULK_VERSION}.jar" && \
  chmod +x /embulk/bin/embulk && \
  cd /usr/local/bin/ && ln -s /embulk/bin/embulk && \
  export PATH=$PATH:/usr/local/bin/embulk

WORKDIR /work
