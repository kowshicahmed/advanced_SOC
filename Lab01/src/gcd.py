def gcd(a, b):
    while (a != b):
        if (a < b): b -= a
        else: a -= b
    return a

print ("gcd(3528,5040) = " + str(gcd(3528,5040)))