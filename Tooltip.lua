local addonName, ns = ...

local MYTHIC_PLUS_DUNGEONS = {
    [1] = "Black Rock Hold",
    [2] = "The Everbloom",
    [3] = "Darkheart Thicket",
    [4] = "Waycrest Manor",
    [5] = "Atal'Dazar",
    [6] = "Throne of the Tides",
    [7] = "Dawn of the Infinite: Galakrond's Fall",
    [8] = "Dawn of the Infinite: Murozond's Rise"
}

-- Function to check if a value is in a table
function IsInTable(value, tbl)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

-- Keystone Tooltip
function OnKeystoneTooltip(tooltip, data)
    if string.match(data.lines[1].leftText, "Keystone:") then
        if tooltip == GameTooltip then
            local keystoneLevel = tonumber(string.sub(data.lines[2].leftText, 14, 16)) or 0
            local weeklyRewardLevel, endOfRunRewardLevel = C_MythicPlus.GetRewardLevelForDifficultyLevel(keystoneLevel)

            tooltip:AddLine(" ")
            tooltip:AddDoubleLine("End of Dungeon Reward ilvl", endOfRunRewardLevel, 1, 0.85, 0, 1, 1, 1)
            tooltip:AddDoubleLine("Great Vault Reward ilvl", weeklyRewardLevel, 1, 0.85, 0, 1, 1, 1)
            
        end
    end
end

-- LFG Tooltip
-- function GetKeystoneInfo(unitId)
--     local unitName = GetUnitName(unitId, true) or unitId
--     return KeystoneInfoManager.GetKeystoneInfo(unitName)
-- end

function UpdatePremadeGroupsTooltip(tooltip, data)
    local searchResultData = C_LFGList.GetSearchResultInfo(data)
    local leaderDungeonScoreInfo = searchResultData["leaderDungeonScoreInfo"]
    if leaderDungeonScoreInfo ~= nil and leaderDungeonScoreInfo["mapName"] ~= "" and IsInTable(leaderDungeonScoreInfo["mapName"], MYTHIC_PLUS_DUNGEONS) then
        -- if unitKeystoneInfo then
        --     local keystoneLevel = unitKeystoneInfo.level
        --     DevTools_Dump(keystoneLevel)
        -- end

        tooltip:AddLine(" ")
        tooltip:AddDoubleLine("End of Dungeon Reward ilvl", endOfRunRewardLevel, 1, 0.85, 0, 1, 1, 1)
        tooltip:AddDoubleLine("Great Vault Reward ilvl", weeklyRewardLevel, 1, 0.85, 0, 1, 1, 1)
    end
end

local addonData = {
    iconHidden = false,
    popupDisabled = false,
    xPos = -74.246212024588,
    yPos = -74.246212024587,
    popupTime = 5,
    tableScale = 1,
    tooltipHidden = false,
    tablePoint = "LEFT",
    tableRelativePoint = "LEFT",
    tableX = 0,
    tableY = 0,
}

SavedVariables = SavedVariables or addonData

-- Event handler thats triggers when the addon has finished loading and based on the SavedVariables, changes values
local function OnAddonLoaded(self, event)
    if addonName == "MythicPlusRewardHelper" then

        -- Check if SavedVariables exist, if it does not, the default data will be saved
        SavedVariables = SavedVariables or addonData

        if not SavedVariables.tooltipHidden then
            TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnKeystoneTooltip)
            hooksecurefunc("LFGListUtil_SetSearchEntryTooltip", UpdatePremadeGroupsTooltip)
        end

        -- Unregister the event
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function ResetSavedVariables()
    SavedVariables = addonData
end

local frame = CreateFrame("Frame", "MythicPlusRewardHelper")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnAddonLoaded)