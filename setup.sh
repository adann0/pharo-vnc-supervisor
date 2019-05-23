#!/bin/bash

# supervisor log file
mkdir -p $SQUEAK_HOME/logs && touch $SQUEAK_HOME/logs/$SQUEAK_SUPERVISOR_LOG_NAME

# vnc
/bin/bash /dockerstartup/vnc_startup.sh &
