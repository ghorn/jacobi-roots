#include <stdio.h>
#include "foo_data.c"

int main(){
  int counter = 0;
  int root_counter = 0;
  while (counter < N){
    printf("%d: ", root_counter);
    for (int k=0; k<root_counter; k++){
      printf("%f ", foo_data[counter]);
      counter++;
    }
    printf("\n");
    root_counter++;
  }

  return 0;
}
