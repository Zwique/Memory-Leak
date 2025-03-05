# Step 1: Use a base image with gcc for compiling
FROM gcc:latest

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the C source code into the container
COPY leaky_vault.c .

# Step 4: Compile the C source code to create the executable
RUN gcc -o leaky_vault leaky_vault.c

# Step 5: Set the command to run the program when the container starts
CMD ["./leaky_vault"]
