#!/bin/bash
#
# USAGE
# ./audioprocessing.bash SPEECH_SCRIPT DIALING_SCRIPT
#
# Text from SPEECH_SCRIPT is voice synthesized into the file synthesized.wav
# Then sound files noted in DIALING_SCRIPT are concatenated in order
# specified to create ./processed.wav
#


#
# Clean up
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm -f $DIR/processed.wav $DIR/processed.raw $DIR/synthesized.aif


#
# Synthesize the message from STDIN
#

cat $1 | say -o $DIR/synthesized.aif
#cat $1 | text2wave -o $DIR/synthesized.aif


#
# Now concatenate all files in script to one audio
#

for a in $(grep -v "#" $2)
do
  sox $DIR/$a.* -t raw -r 44100 -c1 -e signed-integer - >> $DIR/processed.raw
done


#
# skype reqires 16-bit 16khz files, see
# https://developer.skype.com/jira/browse/SPA-150
#

sox -t raw -e signed-integer -b16 --endian little -r 44100 -c 1 $DIR/processed.raw -t wav -r 16000 $DIR/processed.wav


#
# Clean up
#

rm -f $DIR/processed.raw $DIR/synthesized.aif

