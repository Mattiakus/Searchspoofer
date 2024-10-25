#!/bin/bash
#this script is intended to make a few google/bing/amazon searches
#for poisoning the data that marketing companies keep selling


# This checks if all arguments are given and sets them
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <file> <amount_of_searches>"
	exit 1
fi
file="$1"
searchcount="$2"

# Check if file exists
if [ ! -f "$file" ]; then
	echo "File does not exist"
	exit 1
fi

# Getting the total number of lines in the file to check if we can make this nany searches
noofterms=$(wc -l < "$file")
if [ "$searchcount" -gt "$noofterms" ]; then
	echo "number is greater than amount of searchterms."
	exit 1
fi


readarray searchterms < searchterms.txt #this converts our wordlist

googleprefix=("https://www.google.com/search?q=") #idk how to explain this part :(
bingprefix=("https://www.bing.com/search?q=")	  #these are the prefixes  to which we only have to append the keywords
amazonprefix=("https://amazon.com/s?k=")

searchcommand=("")

for((i = 0 ; i < searchcount; i++)); do
	searchcommand+=("--new-tab")
	searchcommand+=(${googleprefix}${searchterms[i]})
	searchcommand+=("--new-tab")
	searchcommand+=(${bingprefix}${searchterms[i]})
	searchcommand+=("--new-tab")
	searchcommand+=(${amazonprefix}${searchterms[i]})
done

#echo ${searchcommand[*]}  #<---just a command for debugging
firefox ${searchcommand[*]}


# this takes the first part lines you selected and places them to the end
{ tail -n +$((searchcount + 1)) "$file"; head -n "$searchcount" "$file"; } > temp.txt && mv temp.txt "$file"
