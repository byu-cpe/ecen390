### Malloc, Pointers and Arrays in 'C'

The circular-buffer approach uses an array to store the data contained
within the queue. However, we want to be able to set the size of the
array when the queue is initialized. We do that by allocating a block of
memory of the desired size during initialization and then using that
block as our array.

```c
queue_data_t * data
```

The code above declares a variable named data that should ultimately
"point" to a chunk of memory that contains something of type
`queue_data_t` (`typedef double queue_data_t`). However, at this point,
all we have done is to tell the compiler that, when we refer to the
pointer `data`, we will treat what it points to as a `queue_data_t`.
This allows the compiler to ensure that we are consistent when we use
this pointer later in our code. By way of reminder, `double` refers to a
number that is double-precision floating point.

It is important to note that when the pointer `data` is
declared/defined, it actually points to nothing. At run-time, we need to
allocate memory that `data` will "point" to. This is the job of
`malloc()` (`malloc()` stands for "memory-allocation", if you like).
Here is an example where the declaration of the pointer and allocation
of memory are done in one line of code:

```c
queue_data_t * data = (queue_data_t *) malloc(4 *
sizeof(queue_data_t));
```

In the simple example shown above, I have told `malloc()` that I want a
chunk of memory that is big enough to hold 4 items, where each item is
the size of a `queue_data_t` (again, `queue_data_t` is a double).
`sizeof()` is a compiler primitive that will return the number of bytes
that a particular data-type requires. If your curious about how many
bytes are occupied by a variable of size double, you can write a simple
program and find out:

```c
#include <stdio.h>
void main() {
  printf("A double requires %d bytes.\n\r", sizeof(double));
}
```

If you run this code on the ECEN 330 board, it will print out:

"A double requires 8 bytes."

In any case, once we have executed the `malloc()` code above, the `data`
pointer now points to a block of memory that is 32 bytes in size (4
doubles). In 'C', a pointer and a 1-dimensional array are essentially
the same thing. With memory properly allocated, I can now treat the
`data` pointer exactly as an array. For example, I could initialize my
`data` array using the code below:

```c
for (int16_t i=0; i<4; i++) {
  data[i] = 0.0;
}
```

Or, I could print out the contents of my `data` array using the code
below:

```c
#include <stdio.h>

for (int16_t i=0; i<4; i++) {
    printf("data[%d]:%le\n\r", i, data[i]);
}
```

-----
