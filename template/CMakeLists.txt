
cmake_minimum_required(VERSION 3.16)
project( {name} VERSION 0.1.0 LANGUAGES C)

set(source 
    "src/{name}.c"
    "src/{name}.h"
    )


set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)


add_library({name} STATIC ${source})
target_compile_definitions({name} PUBLIC $<$<CONFIG:Debug>:{NAME}_DEBUG>
                                       $<$<CONFIG:Release>:{NAME}_RELEASE>)


if (UNIX)
   target_compile_options({name} PRIVATE -Wall -Werror  
                $<$<CONFIG:Debug>:-ggdb -fsanitize=address> 
                $<$<CONFIG:Release>:-O3>  ) 
    
   target_link_options({name} PRIVATE  
   $<$<CONFIG:Debug>:-fsanitize=address -static-libasan>)
endif (UNIX)

add_subdirectory(tests)
