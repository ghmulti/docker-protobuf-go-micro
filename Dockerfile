FROM gnhuy91/protobuf

RUN mkdir -p /go/src /go/bin \
    && chmod -R 777 /go/bin

ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH

ENV BUILD_PACKAGES="git ca-certificates go"

RUN apk add --update --no-cache $BUILD_PACKAGES \
    # Get Go protobuf
    && go get -u \
	github.com/micro/protobuf/proto \
	github.com/micro/protobuf/protoc-gen-go \
	# github.com/micro/micro \
    # Cleanup
    && rm -rf $GOPATH/src/* \
    && apk del --purge $BUILD_PACKAGES \
    && rm -rf /var/cache/apk/*

