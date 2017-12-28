# wichteln
Wichteln (secret santa) for bash

enter names and mail addresses in file "names" - examples inside.

edit main.sh and set "rounds" to how many people you want to assign to each secret santa - default is 2

run main.sh - this will create a file named "result", if you get "ERROR!" the random assigning of people couldn't finish properly, for example there's only the same person left to gift to himself. Just run it again and randomness will hopefully find a solution this time.
If you keep getting the error message all the time, check if you do have enough people for the amount of rounds, for example, you can't do 2 rounds with just 2 people.

Once finished, edit send_mails.sh and insert your actual mail command, maybe edit the text and then run this script too, to send out the mails.

Have fun!
