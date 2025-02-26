cmake_minimum_required(VERSION 3.16)
project(TESTS VERSION 0.1.0 LANGUAGES C)

set(source 
    "{name}_tests.c"
    "{name}_tests.h"
  )


add_executable({name}_tests ${source})

target_compile_definitions({name}_tests PUBLIC $<$<CONFIG:Debug>:{NAME}_DEBUG>
                                       $<$<CONFIG:Release>:{NAME}_RELEASE>)


if (UNIX)
   target_compile_options({name}_tests PRIVATE -Wall -Werror  
                $<$<CONFIG:Debug>:-ggdb -fsanitize=address> 
                $<$<CONFIG:Release>:-O3>  ) 
    
   target_link_options({name}_tests PRIVATE  
   $<$<CONFIG:Debug>:-fsanitize=address -static-libasan>)

endif (UNIX)

target_link_libraries({name}_tests PUBLIC {name})
target_include_directories({name}_tests PUBLIC ${CMAKE_SOURCE_DIR})
