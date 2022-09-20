#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Lock Screen
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔒
# @raycast.packageName Shortwave Utils

# Documentation:
# @raycast.description Sign off of Shortwave for the day
# @raycast.author Tyler Rockwood
# @raycast.authorURL https://github.com/rockwotj

# Close Gather
tell application "Google Chrome"
	set windowList to every tab of every window whose URL starts with "https://app.gather.town"
	repeat with tabList in windowList
		set tabList to tabList as any
		repeat with tabItr in tabList
			set tabItr to tabItr as any
			delete tabItr
		end repeat
	end repeat
end tell

# Lock the screen using the global shortcut.
activate application "SystemUIServer"
tell application "System Events"
    tell process "SystemUIServer" to keystroke "q" using {command down, control down}
end tell
