#!/bin/bash

playerctl --follow metadata --format '{"text": "{{ artist }} - {{ title }}", "tooltip": "{{ playerName }}: {{ artist }} - {{ title }}", "class": "{{ status }}", "alt": "{{ status }}"}' 2>/dev/null

echo '{"text": "", "class": "", "alt": "Stopped"}'
