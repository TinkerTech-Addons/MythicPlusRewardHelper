-- MPRH.lua (MythicPlusRewardHelper)
-- Handles the main functionality of the MythicPlusRewardHelper WoW Addon.

--#region Create locally and globaly used variables
local addonName, ns = ...
ns = ns or {}
ns.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
ns.buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate")

-- Table to hold account saved settings
MPRH_Settings = MPRH_Settings or {}
--#endregion

--#region Local slash command handler function.
local function SlashCommandHandler(message)
    if message == "v" or message == "version" then
        print("Addon Name: " .. addonName)
        print("   Version: " .. ns.addonVersion)
        print("Build Date: " .. ns.buildDate)
    elseif message == "show" then
        ns.ShowSettingsFrame()
    else
        print("Mythic Plus Reward Helper Usage:")
        print("  /mythicplusrewardhelper |cFF14cd33show|r      - Open the settings")
        print("  /mythicplusrewardhelper |cFF14cd33v|version|r - Print out the addon name and current version")
        print("Shorthand Slash Commands:")
        print("  /mpr")
        print("  /mprh")
    end
end
--#endregion

--#region Register the addon slash commands
SLASH_MYTHICPLUSREWARDHELPER1 = "/mpr"
SLASH_MYTHICPLUSREWARDHELPER2 = "/mprh"
SLASH_MYTHICPLUSREWARDHELPER3 = "/mythicplusrewardhelper"
SlashCmdList["MYTHICPLUSREWARDHELPER"] = SlashCommandHandler
--#endregion

--#region Local on addon loaded event handler function
local function OnAddonLoaded(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        ns.OnInitialize()
    end

    if event == "ADDON_LOADED" and addonName == "mythicplusrewardhelper" then
        print("Loaded MythicPlusRewardHelper")
        print("   Version: " .. ns.addonVersion)
        print("Build Date: " .. ns.buildDate)
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ns.OnKeystoneTooltip)

        self:UnregisterEvent("ADDON_LOADED")
    end
end
--#endregion

--#region Register the addon events and set the load script
local frame = CreateFrame("Frame", "MythicPlusRewardHelper")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", OnAddonLoaded)
--#endregion
