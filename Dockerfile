# Base image
FROM debian:bullseye

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# Copy challenge and flag files into the container
COPY ./leaky_vault.c /leaky_vault.c

# Compile the challenge
RUN gcc /leaky_vault.c -o /leaky_vault

# Expose the port you want to listen on (use 9999 or any other port)
EXPOSE 1337

# Use netcat to listen on the specified port and run the wish binary
CMD ["sh", "-c", "while true; do nc -l -p ${PORT:-1337} -e /leaky_vault; done"]
