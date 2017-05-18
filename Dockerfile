FROM golang:1.7-alpine

MAINTAINER Satish Puranam <spuranam@ford.com>

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://git.dev/spuranam/croc-hunter" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

COPY . /go/src/git.dev/spuranam/croc-hunter
COPY static/ static/

ENV GIT_SHA $VCS_REF
ENV GOPATH /go
RUN cd $GOPATH/src/git.dev/spuranam/croc-hunter && go install -v .

CMD ["croc-hunter"]

EXPOSE 8080

