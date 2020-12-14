FROM alpine:3.12.2

RUN apk add --no-cache ca-certificates

ADD ./template-operator /template-operator

ENTRYPOINT ["/template-operator"]
