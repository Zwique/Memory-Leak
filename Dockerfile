# Base image
FROM debian:bullseye

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    socat \
    && rm -rf /var/lib/apt/lists/*

# Copy challenge and flag files into the container
COPY ./leaky_vault.c /leaky_vault.c
COPY ./flag.txt /flag.txt

# Compile the challenge
RUN gcc -fno-stack-protector -z execstack -no-pie /leaky_vault.c -o /leaky_vault

# Expose the port you want to listen on (use 1337 or any other port)
EXPOSE 1337

# Use socat to listen on the specified port and run the binary
CMD ["socat", "TCP-LISTEN:1337,reuseaddr,fork", "EXEC:/leaky_vault"]
