#!/bin/sh

name=${1:-dummy}

tdir=".cpptemplate"

if test ! -d "$tdir"; then
    echo "Cannot find template $dir"
fi

echo "Create project $name using template $tdir"


cp -r $tdir $name;

sed -i "s/{name}/${name}/g" ${name}/CMakeLists.txt
sed -i "s/{NAME}/${name^^}/g" ${name}/CMakeLists.txt

cd ${name}/src
sed -i "s/{name}/${name}/g" main.c
sed -i "s/{name}/${name}/g" main.h

mv main.c ${name}.c && mv main.h ${name}.h
cd ../tests

sed -i "s/{name}/${name}/g"  CMakeLists.txt 
sed -i "s/{name}/${name^^}/g"  CMakeLists.txt 

sed -i "s/{name}/${name}/g"  main_tests.c
sed -i "s/{name}/${name}/g"  main_tests.h

mv main_tests.c ${name}_tests.c && mv main_tests.h ${name}_tests.h

