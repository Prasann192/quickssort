#!/bin/bash

# Run DeterministicQuickSort and RandomizedQuickSort on inputs having sizes over a given range. 
# Store the runtimes and tabulate as a csv.

# Generate the latest executables.
make clean
make

# Generate a fresh file to store runtimes
rm runtimes_Almost_Sorted.csv
touch runtimes_Almost_Sorted.csv
rm runtimes_random_Input.csv
touch runtimes_random_Input.csv

# Input Size Range

FROM_SIZE=11
TO_SIZE=10001
STEP_SIZE=401
TRIALS=10

quickSort_ave_timings=()
randQuickSort_ave_timings=()
n_data_points=0
input_sizes=$( seq $FROM_SIZE $STEP_SIZE $TO_SIZE )

# echo "INPUT sizes , $input_sizes"

# Collect Average Run-Times
for size in $input_sizes 
do
    quickSort_trials_time=0
    randQuickSort_trials_time=0
    (( n_data_points++ ))
    echo "Size $size"

    for trial in $( seq 1 $TRIALS)
    do
        python input_generator_almost_sorted.py $size
            
        time=$( ./deterministicQuickSort )
        
        (( quickSort_trials_time += time))

        python input_generator_almost_sorted.py $size

        time=$(./randomizedQuickSort )

        (( randQuickSort_trials_time += time))
    
    done

    ave_time=$(( quickSort_trials_time / TRIALS ))
    quickSort_ave_timings+=($ave_time)

    ave_time=$(( randQuickSort_trials_time / TRIALS ))
    randQuickSort_ave_timings+=($ave_time)

    # echo "Deterministic-Quick-Sort Averages ${quickSort_ave_timings[@]}"
    # echo "Randomized-Quick-Sort Averages ${randQuickSort_ave_timings[@]}"
done

# Write To CSV File
# printf "Host\tDate\tOperation\tDuration\n" >> log.csv
echo "Input-Size, RandomizedQuickSort (microsec), DeterministicQuickSort (microsec)" >> runtimes_Almost_Sorted.csv

for i in $( seq 0 $(( n_data_points - 1 )) ) 
do
    (( size = FROM_SIZE + i * STEP_SIZE ))

    echo "$size, ${randQuickSort_ave_timings[i]}, ${quickSort_ave_timings[i]}" >> runtimes_Almost_Sorted.csv

done


#random output

# Input Size Range

FROM_SIZE=0
TO_SIZE=10000
STEP_SIZE=400
TRIALS=10

quickSort_ave_timings=()
randQuickSort_ave_timings=()
n_data_points=0
input_sizes=$( seq $FROM_SIZE $STEP_SIZE $TO_SIZE )

# echo "INPUT sizes , $input_sizes"

# Collect Average Run-Times
for size in $input_sizes 
do
    quickSort_trials_time=0
    randQuickSort_trials_time=0
    (( n_data_points++ ))
    echo "Size $size"

    for trial in $( seq 1 $TRIALS)
    do
        python input_generator.py $size
            
        time=$( ./deterministicQuickSort )
        
        (( quickSort_trials_time += time))

        python input_generator.py $size

        time=$(./randomizedQuickSort )

        (( randQuickSort_trials_time += time))
    
    done

    ave_time=$(( quickSort_trials_time / TRIALS ))
    quickSort_ave_timings+=($ave_time)

    ave_time=$(( randQuickSort_trials_time / TRIALS ))
    randQuickSort_ave_timings+=($ave_time)

    # echo "Deterministic-Quick-Sort Averages ${quickSort_ave_timings[@]}"
    # echo "Randomized-Quick-Sort Averages ${randQuickSort_ave_timings[@]}"
done

# Write To CSV File
# printf "Host\tDate\tOperation\tDuration\n" >> log.csv
echo "Input-Size, RandomizedQuickSort (microsec), DeterministicQuickSort (microsec)" >> runtimes_random_Input.csv

for i in $( seq 0 $(( n_data_points - 1 )) ) 
do
    (( size = FROM_SIZE + i * STEP_SIZE ))

    echo "$size, ${randQuickSort_ave_timings[i]}, ${quickSort_ave_timings[i]}" >> runtimes_random_Input.csv

done
