-- MythicPlusRewardHelper.lua

-- Create localy used variables
local addonName, ns = ...
ns.addonVersion = C_AddOns.GetAddOnMetadata("MythicPlusRewardHelper", "Version")

-- Create golbaly used variables
MPRH_SETTINGS = {}
MYTHIC_PLUS_REWARDS_TABLE = {}

-- Slash command handler
local function SlashCommandHandler(msg)
    if msg == "show" then
        ns.ShowSettingsFrame()
    elseif msg == "hide" then
        ns.HideSettingsFrame()
    elseif msg == "version" or msg == "v" then
        print("Addon Name: " .. addonName)
        print("Version : " .. ns.addonVersion)
    else
        print("MPR Usage:")
        print("  /mpr show      - Show the MPR Settings GUI")
        print("  /mpr hide      - Hide the MPR Settings GUI")
        print("  /mpr v|version - Print the addon name and version")
    end
end

-- Register slash commands
SLASH_MYTHICPLUSREWARDHELPER1 = '/mpr'
SLASH_MYTHICPLUSREWARDHELPER2 = '/mprh'
SLASH_MYTHICPLUSREWARDHELPER3 = '/mythicplusrewardhelper'
SlashCmdList['MYTHICPLUSREWARDHELPER'] = SlashCommandHandler

-- helper functions (should be moved)
-- Function to log addon message
function ns.SendAddonLogMessage(message)
    C_ChatInfo.SendAddonMessageLogged("MPRH-", message, "WHISPER", UnitName("player"))
end