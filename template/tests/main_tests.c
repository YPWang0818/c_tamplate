#include "src/{name}.h"

#include "{name}_tests.h"

int tests_run = 0;

static char *mock_test() {

  _assert("Failed to evaluate program.",  printMsg() == 1);

  return 0;
};

static char *all_tests() {

  run_test(mock_test);

  return 0;
}

int main(int argc, char **argv) {
  char *result = all_tests();
  if (result != 0) {
    printf("%s\n", result);
  } else {
    printf("ALL TESTS PASSED\n");
  }
  printf("Tests run: %d\n", tests_run);

  return result != 0;
}
