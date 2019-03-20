#!/bin/bash

echo "--\$0 The zeroth argumewnt is the file name itself:             $0"
echo "--\$n prints the 'n'th argument passed to script, ex \$1:        $1"
echo "--\$# prints the number of arguments supplied to a script:      $#"
echo "--\$* groups all the arguments, passed, into single entity:     $*"
echo "--\$@ makes a table of all the arguments, passed, to script:    $@"
echo "--\$? Prints the exit status of the last command executed:      $?"
echo "--\$\$ prints the process number of current shell script:        $$"
echo "--\$! prints the process number of the last background command: $!"
