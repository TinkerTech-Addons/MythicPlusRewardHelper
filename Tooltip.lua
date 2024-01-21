local addonName, ns = ...

local KEYSTONE_LEVEL_TO_DUNGEON_ILVL_REWARDS = { -- Table over keystone levels and the end of dungeon item level rewards for that keystone level.
    [2] = 441,
    [3] = 444,
    [4] = 444,
    [5] = 447,
    [6] = 447,
    [7] = 450,
    [8] = 450,
    [9] = 454,
    [10] = 454,
    [11] = 457,
    [12] = 457,
    [13] = 460,
    [14] = 460,
    [15] = 463,
    [16] = 463,
    [17] = 467,
    [18] = 467,
    [19] = 470,
    [20] = 470
}

-- Helper function to get end of dungeon item level from keystone level.
function GetEndOfDungeonRewardIlvl(keystoneLevel)
    if tonumber(keystoneLevel) > 20 then
        keystoneLevel = 20
    end
    return KEYSTONE_LEVEL_TO_DUNGEON_ILVL_REWARDS[keystoneLevel]
end

-- Keystone Tooltip
function OnKeystoneTooltip(tooltip, data)
    if string.match(data.lines[1].leftText, "Keystone:") then
        if tooltip == GameTooltip then
            local keystoneLevel = tonumber(string.sub(data.lines[2].leftText, 14, 16)) or 0
            local greatVaultRewardIlvl = C_MythicPlus.GetRewardLevelFromKeystoneLevel(keystoneLevel)
            local endOfDungeonIlvl = GetEndOfDungeonRewardIlvl(keystoneLevel)

            tooltip:AddLine(" ")
            tooltip:AddDoubleLine("End of Dungeon Reward ilvl", endOfDungeonIlvl, 1, 0.85, 0, 1, 1, 1)
            tooltip:AddDoubleLine("Great Vault Reward ilvl", greatVaultRewardIlvl, 1, 0.85, 0, 1, 1, 1)
        end
    end
end

-- LFG Tooltip
function UpdatePremadeGroupsTooltip(tooltip, data)
    local searchResultData = C_LFGList.GetSearchResultInfo(data)
    print(searchResultData["name"])
    tooltip:AddLine("TESTING 123!@#", "ABC", 1, 0.85, 0, 1, 1, 1)
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