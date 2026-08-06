#!/bin/sh
playerctl metadata --format '{"text": "{{ markup_escape(title) }}", "tooltip": "{{ markup_escape(artist) }}"}' | jq -c
