FROM golang:1.7.5-alpine

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH/src/github.com/root/

RUN apk --update add git gcc musl-dev \
 && rm -rf /var/cache/apk/*

RUN go get -u github.com/mijia/modelq
RUN go get -u github.com/smartystreets/goconvey
RUN go get -u gopkg.in/check.v1
