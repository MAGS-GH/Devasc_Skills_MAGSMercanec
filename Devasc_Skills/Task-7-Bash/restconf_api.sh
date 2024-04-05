#!/bin/bash

# Set variables
IP_HOST="192.168.56.101"
RESTCONF_USERNAME="cisco"
RESTCONF_PASSWORD="cisco123!"
DATA_FORMAT="application/yang-data+json"
LOOPBACK_INTERFACE="Loopback199"
LOOPBACK_IP="10.1.99.1"
OUTPUT_FILE="check_restconf_api.txt"

# Function to print current date
print_date() {
    echo "$(date '+%a, %b %d, %Y %r')"
}

# Function to print separator
print_separator() {
    echo "============="
}

# Function to print status code and interfaces (if applicable)
print_status() {
    echo "Status Code: $1"
    if [[ -n $2 ]]; then
        echo "Interfaces: $2"
    fi
}

# Start of script
print_date > "$OUTPUT_FILE"
echo "START REST API CALL" >> "$OUTPUT_FILE"
print_separator >> "$OUTPUT_FILE"

# FIRST API CALL
echo "FIRST API CALL" >> "$OUTPUT_FILE"
print_separator >> "$OUTPUT_FILE"
status_code=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -u "$RESTCONF_USERNAME:$RESTCONF_PASSWORD" -H "Accept: $DATA_FORMAT" -H "Content-type: $DATA_FORMAT" -d '{
  "ietf-interfaces:interface": {
     "name": "'"$LOOPBACK_INTERFACE"'",
     "description": "RESTCONF => '"$LOOPBACK_INTERFACE"'",
     "type": "iana-if-type:softwareLoopback",
     "enabled": true,
     "ietf-ip:ipv4": {
         "address": [
             {
                 "ip": "'"$LOOPBACK_IP"'",
                 "netmask": "255.255.255.0"
             }
         ]
     }
 }}' "https://$IP_HOST/restconf/data/ietf-interfaces:interfaces/interface=$LOOPBACK_INTERFACE" --insecure)
print_status "$status_code" >> "$OUTPUT_FILE"

# SECOND API CALL
echo "SECOND API CALL" >> "$OUTPUT_FILE"
print_separator >> "$OUTPUT_FILE"
status_code=$(curl -s -o /dev/null -w "%{http_code}" -X GET -u "$RESTCONF_USERNAME:$RESTCONF_PASSWORD" -H "Accept: $DATA_FORMAT" "https://$IP_HOST/restconf/data/ietf-interfaces:interfaces" --insecure)
interfaces=$(curl -s -u "$RESTCONF_USERNAME:$RESTCONF_PASSWORD" -H "Accept: $DATA_FORMAT" "https://$IP_HOST/restconf/data/ietf-interfaces:interfaces" --insecure)
print_status "$status_code" "$interfaces" >> "$OUTPUT_FILE"

# End of script
echo "END REST API CALL" >> "$OUTPUT_FILE"
