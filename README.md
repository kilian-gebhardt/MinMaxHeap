# MinMaxHeap
Implementation of a Min-Max-Heap [1] in Python and C++ (+Cython) bindings.

For testing compile and run the Cython code with

```
cythonize -i testminmax.pyx
./run.sh
```

which should output something like:

```
[1, 494, 496, 41, 11, 7, 19, 443, 474, 486, 466, 411, 350, 481, 450, 56, 82, 113, 51, 45, 30, 32, 163, 41, 90, 140, 136, 321, 109, 73, 42, 415, 433, 384, 428, 458, 471, 399, 328, 325, 411, 465, 295, 327, 309, 409, 333, 352, 377, 372, 206, 212, 194, 243, 295, 339, 420, 244, 398, 142, 263, 90, 279, 238, 233, 152, 166, 370, 156, 199, 147, 271, 372, 327, 344, 155, 390, 305, 134, 270, 220, 83, 229, 246, 457, 286, 244, 113, 193, 245, 79, 278, 311, 223, 210, 268, 287, 175, 118, 98]
OK
Time C++ heap: 0.004196
Time PyHeap: 0.383792
```

The C++/Cython implementation is about two orders of magnitute faster than the Python implementation.

[1] Atkinson, Sack, Santoro, and Strothotte (1987), [Min-max heaps and generalized priority queues](https://doi.org/10.1145/6617.6621).
