FROM golang:1.21.5-alpine AS go-extractor
RUN cp -r /usr/local/go /tmp/go-copy

FROM owasp/dependency-check@sha256:cfb5c429533f1da9d960c93b6f631c34bf7ecb6e2498273c00cac01f3b62a20a

COPY --from=go-extractor /tmp/go-copy /opt/go

ENV GOROOT="/opt/go"
ENV PATH="/opt/go/bin:${PATH}"

RUN go version