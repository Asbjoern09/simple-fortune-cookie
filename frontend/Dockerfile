FROM golang:1.19
WORKDIR /app
COPY . /app
RUN cd /app && go build -o frontend  # Ensure the binary is named frontend
CMD ["go", "run", "frontend"]