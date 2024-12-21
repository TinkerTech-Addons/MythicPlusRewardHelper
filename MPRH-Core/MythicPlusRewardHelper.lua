-- MPRH.lua (MythicPlusRewardHelper)
-- Handles the main functionality of the MythicPlusRewardHelper WoW Addon.

--#region Create locally and globally used variables
local addonName, ns = ...
ns = ns or {}
ns.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
ns.buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate")

--#region Local slash command handler function.
local function SlashCommandHandler(message)
    if message == "v" or message == "version" then
        print("Addon Name: " .. "|cDBB670FFMythic Plus Reward Helper|r")
        print("   Version: " .. ns.addonVersion)
        print("Build Date: " .. ns.buildDate)
    elseif tonumber(message) then
        ns.buildSlashInfo(tonumber(message))
    else
        print("|cDBB670FFMythic Plus Reward Helper|r Usage:")
        print("  /mythicplusrewardhelper |cFF14cd33v|version|r - Print out the addon name and current version")
        print(
            "  /mythicplusrewardhelper |cFF14cd33<keystone level>|r - Print Mythic Plush Reward Helper information for the supplied keystone level")
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
    if event == "ADDON_LOADED" and addonName == "MythicPlusRewardHelper" then
        print("-----------------------------------")
        print("|cDBB670FFMythic Plus Reward Helper|r")
        print("Version: " .. ns.addonVersion)
        print("Build Date: " .. ns.buildDate)
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ns.OnKeystoneTooltip)

        self:UnregisterEvent("ADDON_LOADED")
    end
end
--#endregion

--#region Register the addon events and set the load script
local frame = CreateFrame("Frame", "MythicPlusRewardHelper")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnAddonLoaded)
--#endregion
