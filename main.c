#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//Incluyo directamente el source (me parece que va a ser más fácil para pasar a assembler.)
#include "matrix.c"

//Lee del standar input una cadena de longitud variable y la devuelve.
char* readFromStdIn();
//valida si lo leído es correcto o no.
int validate(char* string);

int main()
{
    char* stringRead = readFromStdIn();
    validate(stringRead);
    
    free(stringRead);
    return 0;

}

char* readFromStdIn()
{
    unsigned int len_max = 128;
    unsigned int current_size = 0;

    char *pStr = malloc(len_max);
    current_size = len_max;

    if(pStr != NULL)
    {
        int c = EOF;
        unsigned int i =0;
        while (( c = getchar() ) != '\n' && c != EOF)
        {
            pStr[i++]=(char)c;

            //llegué al máximo tamaño.
            if(i == current_size)
            {
                current_size = i+len_max;
                pStr = realloc(pStr, current_size);
            }
        }

        pStr[i] = '\0';

        printf("\nReaded value:%s \n\n",pStr);
        
    } else {
        //LOG STD ERR 
        //Falló el malloc, hay que avisar.
    }

    return pStr;

}

int validate(char* stringRead) {

    //TODO - devuelve códigos de error si el input es inválido
    //Caso 1: las matrices no son de tamaño nxn
    //Caso 2: algún elemento no está en el standar que dijo la cátedra
    
    //Devuelve 0 si todo está OK.
    return 0;
}