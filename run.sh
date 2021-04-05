#!/bin/sh

DOCUMENT=$(basename $GEDIT_CURRENT_DOCUMENT_NAME|sed 's/\(.*\)\..*/\1/')
EXT=$(basename $GEDIT_CURRENT_DOCUMENT_NAME|sed 's/.*\(\..*\)/\1/')
echo $EXT

if   [ $EXT = '.c' ] || [ $EXT = '.cpp' ]; then
     make $DOCUMENT && gnome-terminal -- bash -c ./$DOCUMENT
elif [ $EXT = '.sh' ]; then
     sh $GEDIT_CURRENT_DOCUMENT_NAME
elif [ $EXT = '.py' ]; then
     PYTHON=$(which python||which python3)     
     if [ ! -x $PYTHON ]; then 
           echo ""Python Interpreter not found""
      fi
      gnome-terminal -- bash -c "$PYTHON $GEDIT_CURRENT_DOCUMENT_NAME"
fi
