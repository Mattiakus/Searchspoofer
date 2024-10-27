# Searchspoofer
This poisons your search data by opening firefox and searching for things you have no interest in


This is a small shell script I made to poison your data.
It only works for firefox as my scripting skills really went to the limit
in this script. I am really not good at bash scripting, I just did my best.

Usage: run this program without arguments for help.
After you have given this program permissions to run as a program you should be able to run it using
./searchspoofer.sh <amount_of_searchterms> <browser> <wordlist>

I have also included a wordlist of terms that might make algorithms think you are interested in stuff you actually are not interested in.
When you create your own wordlist please make sure that your entries could be part of a link. So no empty spaces and newlines.
I think it's best to replace empty spaces with a plus sign.

You are free to use, redistribute and edit my software as long as you don't support fascists.
