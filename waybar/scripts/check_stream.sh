#!/bin/bash
# Assoziative Liste mit Streamer-Namen und ihren Aliasen
declare -A STREAMER_ALIASES
STREAMER_ALIASES["laurinchhhe"]="lau"
STREAMER_ALIASES["f1nn5ter"]="f1n"
STREAMER_ALIASES["conureCC"]="CC"
STREAMER_ALIASES["ChrisTitusTech"]="CTT"
STREAMER_ALIASES["huebi"]="ue"
STREAMER_ALIASES["derdunkleparabelritter"]="DP"
STREAMER_ALIASES["feedeline"]="fe"


# Liste der Streamer-Namen
STREAMERS=("laurinchhhe" "f1nn5ter" "conureCC" "ChrisTitusTech" "huebi" "derdunkleparabelritter" "feedeline")

# Variable für die Ausgabe mit Kommas
OUTPUT=""

# Überprüfe den Status für jeden Streamer in der Liste
for ((i=0; i<${#STREAMERS[@]}; i++)); do
  STREAMER_NAME=${STREAMERS[$i]}
  ALIAS=${STREAMER_ALIASES[$STREAMER_NAME]}

  # Überprüfe den HTML-Quellcode der Twitch-Seite, um den Streamer-Status zu finden
  response=$(curl -s "https://www.twitch.tv/$STREAMER_NAME")

  # Überprüfe, ob der Streamer online ist
  if [[ $response == *"\"isLiveBroadcast\":true"* ]]; then
    OUTPUT+="$ALIAS-ø "
  else
    OUTPUT+=""
  fi
done

# Entferne das letzte Komma und Leerzeichen
OUTPUT=${OUTPUT%, *}

# Gebe die Ausgabe in einer Zeile aus
echo $OUTPUT
