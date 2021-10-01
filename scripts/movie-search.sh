#!/bin/bash

RED='\e[31m'
YELLOW='\e[33m'
WHITE='\e[0m'

echo -e "Welcome to the movie searching utility.\n"

echo "Please enter your movie's partial name:"
read userInput

# Substitute [API_KEY] with your API key from OMDb.
apiResponse=$(curl -s "http://www.omdbapi.com/?apikey=[API_KEY]&s=${userInput}")

prettyJson=$(echo "${apiResponse}" | jq -c ".Search[]")

while read -r line; do
  title=$(echo "${line}" | jq -r ".Title")
  year=$(echo "${line}" | jq -r ".Year")
  poster=$(echo "${line}" | jq -r ".Poster")

  echo -e "${RED}${title} ${YELLOW}(${year}) ${WHITE}"
  echo -e "${poster}\n"
done <<< "${prettyJson}"