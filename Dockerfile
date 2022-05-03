FROM golang:1.15.3 as builder
WORKDIR /docker-hw/
COPY . .
RUN go build -o app /docker-hw/app.go

FROM alpine:latest as production
COPY --from=builder /docker-hw/ /docker-hw/
CMD ["./docker-hw"]