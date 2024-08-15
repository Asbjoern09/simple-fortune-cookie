FROM golang:1.19
WORKDIR /app
COPY . /app
RUN cd /app && go build -o backend  # Ensure the binary is named backend
CMD ["go", "run", "backend"]