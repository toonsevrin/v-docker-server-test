FROM alpine:edge as builder
#EXPOSE 8080
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh openssl-dev make build-base

RUN git clone https://github.com/vlang/v  && make -C ./v && ./v/v symlink

COPY main.v . 
RUN v main.v

#CMD ["./main"]

FROM alpine:edge
EXPOSE 8080
COPY --from=builder main .
CMD ["./main"]
