#!/bin/bash

oldIFS=$IFS
IFS=" "
var=`cat fi`

echo $var

IFS=$oldIFS
