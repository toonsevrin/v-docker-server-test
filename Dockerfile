FROM alpine:edge
EXPOSE 8080
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh openssl-dev make build-base

RUN git clone https://github.com/vlang/v && cd v && make && ./v symlink

COPY . . 
RUN "v main.v"

CMD ["./main"]
