FROM alpine:edge
COPY . .
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh openssl-dev make build-base

RUN git clone https://github.com/vlang/v && cd v && make && ./v symlink

EXPOSE 8080
CMD ["v", "run", "main.v"]
