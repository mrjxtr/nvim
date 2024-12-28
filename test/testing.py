import random
import time


class HelloPrinter:

    def print_hello():
        time.sleep(random.randint(2, 5))
        print("Hello World!")


if __name__ == "__main__":
    HelloPrinter.print_hello()
