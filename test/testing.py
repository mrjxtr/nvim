import random
import time


class HelloPrinter:

    def print_hello():
        time.sleep(random.randint(2, 5))
        print("Hello World!")


def fib(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a


# FIX: Testing fix
# TODO: Testing todo
# INFO: Testing info
# NOTE: Testing warning
def main():
    HelloPrinter.print_hello()
    print(fib(10))
    time.sleep(random.randint(2, 5))
    print(fib(20))
    time.sleep(random.randint(2, 5))
    print(fib(30))
