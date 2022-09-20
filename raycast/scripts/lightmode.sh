#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Light Mode
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ☀️
# @raycast.packageName Dev Utils

# Documentation:
# @raycast.description Turn on Light Mode
# @raycast.author Tyler Rockwood
# @raycast.authorURL https://github.com/rockwotj

tell application "System Events" to tell appearance preferences to set dark mode to false
