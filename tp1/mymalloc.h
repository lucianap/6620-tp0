#ifndef __MYMALLOC__H
#define __MYMALLOC__H

#include <stdio.h>
#include <stdlib.h>

extern void *mymalloc(size_t s);

extern void myfree(void * ptr);

#endif // __MYMALLOC__H
