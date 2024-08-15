# Build Stage
FROM golang:1.19 AS builder
WORKDIR /app
COPY . .
RUN go build -o frontend

# Final Stage
FROM gcr.io/distroless/base-debian11
WORKDIR /app
COPY --from=builder /app/frontend /app/frontend
COPY --from=builder /app/templates /app/templates
COPY --from=builder /app/static /app/static
CMD ["/app/frontend"]
