#!/bin/bash

echo "Please enter your city's name:"
read userInput

userInput=$(echo "userInput" | sed -e "s/ /%20/g")

# Substitute [API_KEY] with your API key from OpenWeather API.
apiResponse=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=${userInput}&appid=[API_KEY]")

time=$(date +%s)

prettyJson=$(echo "${apiResponse}" | jq ".")
echo "${prettyJson}" > "${time}.json"