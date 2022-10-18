#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Gather
# @raycast.mode silent

# Optional parameters:
# @raycast.icon https://avatars.githubusercontent.com/u/64757313
# @raycast.packageName Shortwave Utils

# Documentation:
# @raycast.description Opoen Gather
# @raycast.author Tyler Rockwood
# @raycast.authorURL https://github.com/rockwotj
#
# Modified from https://gist.github.com/mayoff/1138816?permalink_comment_id=1821795#gistcomment-1821795

tell application "Google Chrome Beta"
    activate

    set targetUrl to "https://app.gather.town/app/a4AY050K0AzcnGAn/Shortwave"
    set theUrl to my remove_http(targetUrl)

    if (count every window) = 0 then
        make new window
    end if

    set found to false
    set theTabIndex to -1
    repeat with theWindow in every window
        set theTabIndex to 0

        repeat with theTab in every tab of theWindow
            set theTabIndex to theTabIndex + 1
            set theTabUrl to my remove_http(theTab's URL as string)

            if (theTabUrl contains theUrl) then
                set found to true
                exit repeat
            end if

        end repeat

        if found then
            exit repeat
        end if
    end repeat

    if found then
        # tell theTab to reload
        set theWindow's active tab index to theTabIndex
        set index of theWindow to 1
    else
        tell window 1 to make new tab with properties {URL:targetUrl}
        -- Close the default tab that is opened
        tell window 1 to close tab 1
    end if
end tell

on remove_http(input_url)
    if (input_url contains "https://") then
         return trim_line(input_url, "https://")
    else
         return trim_line(input_url, "http://")
    end if
    return input_url
end remove_http

-- Taken from: http://www.macosxautomation.com/applescript/sbrt/sbrt-06.html --
on trim_line(this_text, trim_chars)
    set x to the length of the trim_chars
    -- TRIM BEGINNING
    repeat while this_text begins with the trim_chars
        try
            set this_text to characters (x + 1) thru -1 of this_text as string
        on error
            -- the text contains nothing but the trim characters
            return ""
        end try
    end repeat
    return this_text
end trim_line
