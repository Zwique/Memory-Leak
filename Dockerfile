# Base image
FROM debian:bullseye

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    gcc-aarch64-linux-gnu \  # Cross-compiler for ARM64
    make \
    socat \
    && rm -rf /var/lib/apt/lists/*

# Copy challenge and flag files into the container
COPY ./leaky_vault.c /leaky_vault.c
COPY ./flag.txt /flag.txt

# Compile the challenge for ARM64
RUN aarch64-linux-gnu-gcc -fno-stack-protector -z execstack -no-pie /leaky_vault.c -o /leaky_vault

# Set permissions for the flag file (optional but recommended)
RUN chmod 644 /flag.txt

# Expose the port you want to listen on (use 1337 or any other port)
EXPOSE 1337

# Use socat to listen on the specified port and run the binary
CMD ["sh", "-c", "while true; do nc -l -p 1337 -e /leaky_vault; done"]
