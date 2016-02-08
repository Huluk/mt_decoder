#!/usr/bin/env sh

KS="1 2 3 4 5 10 20 50 100 1000"
SS="1 2 3 4 5 10 20 50 100 1000"

for K in $KS
do
    for S in $SS
    do
        echo "k: $K	s: $S" >> results/decode1
        ./decode -k $K -s $S | ./compute-model-score | tail -1 \
            >> results/decode1
        echo "k: $K	s: $S" >> results/decode2
        ./decode2 -k $K -s $S | ./compute-model-score | tail -1 \
            >> results/decode2
    done
done
