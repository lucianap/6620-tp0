#include "mymalloc.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void *mymalloc(size_t s){
    return malloc(s);
}

void myfree(void * ptr){
    free(ptr);
}
