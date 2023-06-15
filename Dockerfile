#syntax=docker/dockerfile:1.2

FROM golang:1.20 AS build
WORKDIR /go/src

COPY go.mod .
COPY go.sum .
COPY . .
RUN go env

ARG LDFLAGS

RUN --mount=type=cache,target=/root/.cache/go-build --mount=type=cache,target=/go/pkg/mod GOOS=linux CGO_ENABLED=0 go build -mod vendor -ldflags "${LDFLAGS}" -o /usr/bin/docker-log-driver /go/src

FROM alpine:3.17.2
RUN apk --no-cache add ca-certificates curl

COPY --from=build /usr/bin/docker-log-driver /usr/bin/docker-log-driver

ENTRYPOINT ["/usr/bin/docker-log-driver"]
