#!/bin/bash
# This code creates users according to the arguments, 
# and creates a password has "password" for them then adds them to the sudo list.
for a in ${BASH_ARGV[*]}; do
  useradd -d "/home/$a" -m "$a" -p "password" # I don't recommend this password!
  sudo adduser "$a" sudo
done
exit 0;
