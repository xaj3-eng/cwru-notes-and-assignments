def h1(key: int) -> int:
    x = (key + 7) * (key + 7)
    x = x // 16
    x = x + key
    x = x % 11
    return x

def h2(x: int) -> int:
    return 7 - (x % 7)

for i in [43,23,1,0,15,31,4,7,11,3]:
    print(f'{i}: h1-{h1(i)}, h2-{h2(i)}')
