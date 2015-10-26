#!/bin/bash
# Example of how to create a metric producer that generates more than
# one metric using the simple 'generator' binary.

WAITPID=""
./generator ipc://@/malamute "ups-9" "temp" "80" &
WAITPID+="$! "

./generator ipc://@/malamute "ups-9" "hum" "50" &
WAITPID+="$! "

./generator ipc://@/malamute "ups-9" "load" "100" &
WAITPID+="$!"

wait $WAITPID
