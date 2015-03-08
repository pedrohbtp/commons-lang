#!/bin/bash

d=../src

for f in $(cd $d/$v1; find test -name '*\.java')
do
  java -cp locc-4.2.jar csdl.locc.sys.LOCTotal -sizetype javaline -infiles $d/$f
done