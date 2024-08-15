# Build Stage
FROM golang:1.19 AS builder
WORKDIR /app
COPY . .
RUN go build -o backend

# Final Stage
FROM gcr.io/distroless/base-debian11
WORKDIR /app
COPY --from=builder /app/backend /app/backend
CMD ["/app/backend"]
