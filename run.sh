#!/bin/sh

DOCUMENT=$(basename $GEDIT_CURRENT_DOCUMENT_NAME|sed 's/\(.*\)\..*/\1/')
EXT=$(basename $GEDIT_CURRENT_DOCUMENT_NAME|sed 's/.*\(\..*\)/\1/')
echo $EXT

if   [ $EXT = '.c' ] || [ $EXT = '.cpp' ]; then
     make $DOCUMENT && ./$DOCUMENT
elif [ $EXT = '.sh' ]; then
     sh $GEDIT_CURRENT_DOCUMENT_NAME
elif [ $EXT = '.py' ]; then
     PYTHON=$(which python||which python3)     
     if [ ! -x $PYTHON ]; then 
           echo ""Python Interpreter not found""
      fi
      $PYTHON $GEDIT_CURRENT_DOCUMENT_NAME
fi
