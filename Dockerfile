# syntax=docker/dockerfile:1

FROM golang:1.19 as builder

WORKDIR /app

COPY main.go .

RUN go mod init github.com/pedro-lucaas/go-docker

RUN go build -o /app/main .

FROM scratch as final

WORKDIR /app

COPY --from=builder /app/main .

CMD ["/app/main"]