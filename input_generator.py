import random
import sys 

def generate_input(N, from_size, to_size):
    
    with open("input.txt", "w") as f:
        f.write(str(N) + " " + "\n")
        for i in range(1, N + 1):
            f.write(str(random.randint(from_size, to_size)) + " ")

if __name__ == "__main__":
    generate_input(int(sys.argv[1]), 1, 1000)
