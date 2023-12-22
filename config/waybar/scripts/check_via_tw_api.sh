#!/bin/bash

# Setze deine Twitch API Client-ID und Secret
CLIENT_ID="YOUR-CLIENT-ID-HERE"
CLIENT_SECRET="YOUR-CLIENT-SECRET_HERE"

# Assoziative Liste mit Streamer-Namen und ihren Aliasen
declare -A STREAMER_ALIASES
STREAMER_ALIASES["laurinchhhe"]="lau"
STREAMER_ALIASES["f1nn5ter"]="f1n"
STREAMER_ALIASES["conureCC"]="cCC"
STREAMER_ALIASES["ChrisTitusTech"]="CTT"
STREAMER_ALIASES["huebi"]="ue"
STREAMER_ALIASES["derdunkleparabelritter"]="DDPR"

# Liste der Streamer-Namen
STREAMERS=("laurinchhhe" "f1nn5ter" "conureCC" "ChrisTitusTech" "huebi" "derdunkleparabelritter" "feedeline")

# Hole das Token von Twitch
token=$(curl -s -X POST "https://id.twitch.tv/oauth2/token?client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&grant_type=client_credentials" | jq -r .access_token)

# Variable für die Ausgabe mit Kommas
OUTPUT=""

# Überprüfe den Status für jeden Streamer in der Liste
for STREAMER_NAME in "${STREAMERS[@]}"; do
  ALIAS=${STREAMER_ALIASES[$STREAMER_NAME]}

  # Überprüfe den Status des Streamers über die Twitch API
  response=$(curl -s -H "Client-ID: $CLIENT_ID" -H "Authorization: Bearer $token" "https://api.twitch.tv/helix/streams?user_login=$STREAMER_NAME")

  # Überprüfe, ob der Streamer online ist
  if [[ $(echo $response | jq -r .data[0].type) == "live" ]]; then
    OUTPUT+="$ALIAS-ø "
  else
    OUTPUT+=""
  fi
done

# Entferne das letzte Komma und Leerzeichen
OUTPUT=${OUTPUT%, *}

# Gebe die Ausgabe in einer Zeile aus
if [ -z "$OUTPUT" ]; then
  echo "-_- nix da"
else
  echo $OUTPUT
fi

