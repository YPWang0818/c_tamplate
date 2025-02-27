
#define _assert(message, test) \
    do {                       \
        if (!(test))           \
            return message;    \
    } while (0)

#define run_test(test)           \
    do                           \
    {                            \
        printf(#test ": ");      \
        char *message = test();  \
        tests_run++;             \
        if (message)             \
        {                        \
            return message;      \
        }                        \
        else                     \
        {                        \
            printf("PASSED!\n"); \
        };                       \
    } while (0)

extern int tests_run;
