#!/bin/bash

DIR=`pwad`

if [[ -z $DIR ]]
then
  DIR=.
fi

chmod +x $DIR/steps/*.sh

for steps in \
  particion   \
  cifrado     \
  volumen     \
  base        \
  config      #\
#  $VM_TYPE    \
#  limpieza
do
  "$DIR/steps/$steps.sh"
done

echo "Todo listo"
