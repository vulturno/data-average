#!/usr/local/bin/bash

jq -c 'map(select(.fecha | contains("-08-")))'
