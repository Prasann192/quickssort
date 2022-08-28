import random
import sys 

def generate_input(N, from_size):
    
    with open("input.txt", "w") as f:
        f.write(str(N) + " " + "\n")
#         for i in range(1, N + 1):
        arr = list(range(from_size,N+1))
        for j in range(3,N,9):
            if(j+2 < N-1):
                arr[j+2],arr[j-1]=arr[j-1],arr[j+2]
        arr = str(arr).replace(',',' ')
        f.write(arr[1:-1])

if __name__ == "__main__":
    generate_input(int(sys.argv[1]), 1)

