#include <stdio.h>

char *hi()
{
  return "Hi!";
}

int main(int argc, char const *argv[])
{
  char *hello = "Hello!";
  printf("char: %s\n", hello);
  char hello2[] = "Hello Hello!";
  printf("char: %s\n", hello2);
  printf("char: %s\n", hi());
}
