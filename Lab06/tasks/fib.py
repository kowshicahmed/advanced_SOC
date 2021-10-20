def fib (i):   
    x = fib(i-1) + fib(i-2) if i>1 else i   
    return x

n = 9
print(f"fib({n})={fib(n)}")