local addonName, ns = ...

local LFG_FRAME = CreateFrame("Frame", "LFGDungeonFrame", UIParent)
LFG_FRAME:SetSize(350, 400)
LFG_FRAME:SetPoint("CENTER")
LFG_FRAME:Hide()

function UpdatePremadeGroupsTooltip(tooltip, data)
    local searchResultData = C_LFGList.GetSearchResultInfo(data)
    local leaderDungeonScoreInfo = searchResultData["leaderDungeonScoreInfo"]
    if leaderDungeonScoreInfo ~= nil and leaderDungeonScoreInfo["mapName"] ~= "" and IsInTable(leaderDungeonScoreInfo["mapName"], MYTHIC_PLUS_DUNGEONS) then
        LFG_FRAME:Show()
    end
end

-- Event handler thats triggers when the addon has finished loading and based on the SavedVariables, changes values
local function OnAddonLoaded(self, event)
    if addonName == "MythicPlusRewardHelper" then
        hooksecurefunc("LFGListUtil_SetSearchEntryTooltip", UpdatePremadeGroupsTooltip)

        -- Unregister the event
        self:UnregisterEvent("ADDON_LOADED")
    end
end

local frame = CreateFrame("Frame", "MythicPlusRewardHelper")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnAddonLoaded)
