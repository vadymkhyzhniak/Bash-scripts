#!/bin/bash

filename="$1"

declare formatted_address
declare name
declare place_id
declare price_level
declare rating
counter=1

while read -r line
do
  if [[ $line == *"formatted_address"* ]]; then
	formatted_address=$(cut --delimiter=':' -f2 <<< "$line")
	formatted_address=${formatted_address:1:-1}
  fi
  if [[ $line == *"name"* ]]; then
	name=$(cut --delimiter=':' -f2 <<< "$line")
	name=${name:1:-1}
  fi
  if [[ $line == *"place_id"* ]]; then
	place_id=$(cut --delimiter=':' -f2 <<< "$line")
	place_id=${place_id:1:-1}
  fi
  if [[ $line == *"price_level"* ]]; then
	price_level=$(cut --delimiter=':' -f2 <<< "$line")
	price_level=${price_level:1:-1}
  fi
  if [[ $line == *"rating"* ]]; then
	rating=$(cut --delimiter=':' -f2 <<< "$line")
	rating=${price_level:1:-1}
  fi
  if [[ $line == *"user_ratings_total"* ]]; then
	echo "${name}, ${formatted_address}, ${place_id}, ${price_level}, ${rating}" > ${counter}.txt
	counter=$((counter+1))
	echo $counter
  fi
done < "$filename"