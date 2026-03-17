# Simple script to get the current weather from OpenWeatherMap free API,
# returning a simple string that is shown as a Polybar module.
#
# Requires a "weather/.env" file with LAT, LON and API_KEY variables.

ENDPOINT=http://api.openweathermap.org/data/2.5
SCRIPT_SUBFOLDER_LOCATION=~/.config/scripts/weather
ENV_LOCATION=$SCRIPT_SUBFOLDER_LOCATION/.env
CURRENT_FILE=$SCRIPT_SUBFOLDER_LOCATION/current.json

# Receives a JSON object with the temperature and weather description, and
# returns this information as a single string with an icon.
get_temp_string () {
    local temp=$(echo "$1" | jq .temp)
    local weather=$(echo "$1" | jq -r .weather)

    local icon=
    if [ $weather = "Clear" ]; then
        icon=󰖨
    elif [ $weather = "Clouds" ]; then
        icon=󰅟
    fi

    echo "$icon $temp°C"
}

# Load and validate the environment variables for this script.
if [ -f $ENV_LOCATION ]; then
    . $ENV_LOCATION

    if [ -z $LAT ]; then
        echo "LAT!"
        exit 1
    elif [ -z $LON ]; then
        echo "LON!"
        exit 1
    elif [ -z $API_KEY ]; then
        echo "KEY!"
        exit 1
    fi
else
    echo "ENV!"
    exit 1
fi

# Get the current weather, saving the response into a file for debugging
# purposes, then filter the weather using jq and output the string to be used
# in Polybar.
curl -s "$ENDPOINT/weather?lat=$LAT&lon=$LON&units=metric&appid=$API_KEY" | jq > $CURRENT_FILE

CURRENT_WEATHER=$(cat $CURRENT_FILE \
    | jq -c '{temp: .main.temp|round, weather: .weather[].main}')

echo $(get_temp_string "$CURRENT_WEATHER")
