FROM alpine:edge
EXPOSE 8080
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh openssl-dev make build-base

RUN git clone https://github.com/vlang/v  && make -C ./v && mv ./v/v /usr/local/bin/v && mv ./v/vlib /usr/local/bin/vlib  && rm -rf ./v

COPY main.v . 
RUN v main.v

CMD ["./main"]
