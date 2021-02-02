FROM alpine:3.13.1

RUN apk add --no-cache ca-certificates

ADD ./template-operator /template-operator

ENTRYPOINT ["/template-operator"]
