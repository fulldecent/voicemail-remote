#!/bin/bash

#
# Point to this file from your cron script
#
# find your voicemail access number at
# http://bridog.net/cellular/voicemail-access-numbers/
#

#
# For access to a SIP account, see
# http://www.callwithus.com/index.php
# http://www.callwithus.com/configuration
# Also see: https://simonics.com/gvgw/help/
#
# If you cant compile sipcmd, see
# ./pjsua* --id sip:testtestte2@sip.freecall.com --registrar sip:sip.freecall.com --realm '*' --username testtestte2 --password test
#


./callscript/speechscript-example1.pl > /tmp/script

./audioprocessing/audioprocessing.bash /tmp/script callscript/dialingscript-example.txt

sipcmd -P sip -u [username] -c [password] -w [server] -x "c;w200;d8005551212;ws3000;vprocessed.wav;h" 

