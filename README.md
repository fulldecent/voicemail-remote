Voicemail Remote
=========================

Voicemail remote is a complete system to continuously update your voicemail outgoing message with relevant details about your whereabouts:

  * Thank you for calling Will, he is in a meeting titled "Lunch with Bob" right now, please leave a message
  * Thanks for your call, I'll be back in the office 9am tomorrow, Tuesday the 25th
  * Will is in a private meeting right now, please leave a message
  * Sorry I missed your call, please leave a message, I'm now in Philadelphia
  * Please press one to leave a message or continue listening for my latest Tweets...

It is compatible with EVERY voicemail system and works by generating an sound file, dialing into your voicemail system as you, and playing this file which reprograms your outgoing message.


How it works
-------------------------

First a **call script** is generated, then this is **processed** into a single audio file, then this file is **played** on a phone call to your voicemail system.

Prerequisites include:

  * `text2wave` for *NIX OR `say` for Mac
  * `sox` command (`brew install sox`)
  * `sipcmp` (please help with install instructions!)
  * php, perl and other script interpreters (needed to run all the examples)


The call script
-------------------------

The is text that will be voice-synthesized and sent to your outgoing message. You can use scripts in any language to generate this file. Some examples are included, please share your own scripts with a pull request!


Audio processing
-------------------------

This adds dialing instructions, your voicemail PIN number, and menu navigation to modify your outgoing message. Then it prefixes any recorded message in your own voice if desired. This result is a single audio file.


Playback
-------------------------

The single audio file above is played into a phone call for your voicemail system.

