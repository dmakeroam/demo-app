FROM golang:1.26-alpine AS builder
WORKDIR /app
COPY main.go go.mod .
RUN go build -o hello .

FROM alpine:3.20
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["./hello"]
