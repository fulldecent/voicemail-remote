#!/bin/bash
#
# Reads text from STDIN
# Produces ./msg-robot.wav
#


#
# Synthesize the message from STDIN
#
#text2wave < $BASE/msg.txt > $BASE/synthesized.wav
say -o synthesized.aif


#
# SCRIPT is a list of audio files that, when concatenated, will form the
# full sound that is played on a voice call to your voicemail system
#

# VM system says "Please enter your phone number"
SCRIPT="p p p p p p 2 p 6 p 7 p 7 p 3 p 8 p 4 p 2 p 0 p 1 p pound p p p"

# VM system says "Please enter your password"
SCRIPT="$SCRIPT p p p p pound p p p p p p p p p 8 p p 1 p p 2 p p 2 p p pound"

# At the welcome menu, you need to access the "change OGM" menu
SCRIPT="$SCRIPT p p p p 5 p p 2 p p 1 p p 1 p p"

# Here I include a spoken intro
SCRIPT="$SCRIPT spoken-intro"

# ... and then the call script
SCRIPT="$SCRIPT synthesized"

# ... and then end the recording
SCRIPT="$SCRIPT pound"

# VM system says "Press one to confirm your new message"
SCRIPT="$SCRIPT p p p p 1 p p"


#
# Now concatenate all files in script to one audio
#

rm -f ./processed.wav ./processed.raw
for a in $SCRIPT
do
  sox $a.* -t raw -r 44100 -c1 -e signed-integer - >> ./processed.raw
done


#
# skype reqires 16-bit 16khz files, see
# https://developer.skype.com/jira/browse/SPA-150
#

sox -t raw -e signed-integer -b16 --endian little -r 44100 -c 1 ./processed.raw -t wav -r 16000 ./processed.wav


#
# Clean up
#
rm -f ./processed.raw ./synthesized.aif

