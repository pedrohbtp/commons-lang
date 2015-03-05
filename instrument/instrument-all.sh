#!/bin/bash

# Author: Alan Litteneker

FILES=$( find ./target/classes/org/apache/commons/lang3 -name *.class )
CP="./instrument:./instrument/asm-all-5.0.3.jar"
AUXCP=

echo Compiling Instrumenter.java
javac -cp $CP ./instrument/Instrumenter.java

for f in $FILES;
do

echo Instrumenting: $f

# Make a copy of the .class file, instrument from the copy to the original, then delete the backup
cp $f $f.bak
java -cp $CP Instrumenter $f.bak $f
rm $f.bak

done

exit 0
 
