# Instructions of Benchmarking

In this assignment, the goal is to implement two versions of Quick Sort: (a) deterministic and (b) randomized, and measure the execution time of these algorithms on two types of input arrays: (i) randomly generated and (ii) randomly generated and almost sorted. You will have to submit two graphs: (1) plotting the execution times of both deterministic and randomized quick sort against randomly generated inputs, and (2) plotting the execution times of both deterministic and randomized quick sort against randomly generated and almost sorted inputs.

## File Details

1. QuickSort.cpp:
   1. It will contain the deterministic quick sort algorithm implementation. It will read input
      from 'input.txt' and write the sorted output to 'output.txt'.
2. randomizedQuickSort.cpp:
   1. Similar to QuickSort.cpp but for randomized quick sort.
3. timing.sh:
   1. Bash script which will compile the cpp files and run the executables on the
      specified range of input sizes.
   2. For each input size, several runs are done and the average is collected.
   3. The runtime averages are stores in runtimes.csv.

## Workflow

1. Updating the cpp files:
   1. Add your implementations for deterministic and randomized quick sort in the designated places. Test your implementations to make sure they are correct.
   You can compile and run using the following commands (after opening a terminal):
      g++ insertion_sort.cpp
      ./a.out

2. Note that this step is not necessary, as all the parameters have already been set. The adjustable variables (from line no 16 to 19) in timing.sh are:
   1. FROM_SIZE:
      1. The lower range of the input size.
   2. TO_SIZE:
      1. The upper range of the input size.
   3. STEP_SIZE:
      1. input size increment.
   4. TRIALS:
      1. Number of runs whose average will be taken.

3. Run `./timing.sh`, which will do the benchmarking and the result will be stored in
   runtimes_Almost_Sorted.csv and runtimes_random_Input.csv for almost sorted and random inputs repectively.

4. Go to google sheets:
   1. Under the file menu, select the import option.
   2. Upload the runtimes_Almost_Sorted.csv
   3. Chart the sheet, and store the chart using the file name 'almost-sorted-input.png'.

5. Repeat step 4 for runtimes_random_Input.csv, storing the chart using the file name 'random-input.png'.

6. Submitting the files:
   1. Create a folder with name "rollno-lab4-part2".
   2. Include the following files:
      1. edited cpp files containing the implementations i.e.,
         QuickSort.cpp and randomizedQuickSort.cpp
      2. timing.sh.
      3. the two graphs generated in steps 4 and 5.
   3. Zip the folder.
   4. Upload on moodle.
   5. Marking will be based on the correctness of the implementations and graph.
